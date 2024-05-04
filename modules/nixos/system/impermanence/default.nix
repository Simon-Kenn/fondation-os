{
  lib,
  config,
  inputs,
  ...
}:
with lib; let
  cfg = config.fdn.system.impermanence;
  wipeScript =
    /*
    bash
    */
    ''
      mkdir /tmp -p
      MNTPOINT=$(mktemp -d)
      (
        mount -t btrfs -o subvol=/ /dev/disk/by-label/NIXROOT "$MNTPOINT"
        trap 'umount "$MNTPOINT"' EXIT

        echo "Creating needed directories"
        mkdir -p "$MNTPOINT"/persist/var/{log,lib/{nixos,systemd}}

        echo "Cleaning root subvolume"
        btrfs subvolume list -o "$MNTPOINT/root" | cut -f9 -d ' ' |
        while read -r subvolume; do
          btrfs subvolume delete "$MNTPOINT/$subvolume"
        done && btrfs subvolume delete "$MNTPOINT/root"

        echo "Restoring blank subvolume"
        btrfs subvolume snapshot "$MNTPOINT/root-blank" "$MNTPOINT/root"
      )
    '';
  phase1Systemd = config.boot.initrd.systemd.enable;
in {
  imports = [
    inputs.impermanence.nixosModules.impermanence
  ];
  options.fdn.system.impermanence = {
    enable = mkEnableOption "Enable impermanence";
  };

  config = mkIf cfg.enable {
    boot.initrd = {
      supportedFilesystems = ["btrfs"];
      postDeviceCommands = lib.mkIf (!phase1Systemd) (lib.mkBefore wipeScript);
      systemd.services.restore-root = lib.mkIf phase1Systemd {
        description = "Rollback btrfs rootfs";
        wantedBy = ["initrd.target"];
        requires = [
          "dev-disk-by\\x2dlabel-NIXROOT.device"
        ];
        after = [
          "dev-disk-by\\x2dlabel-NIXROOT.device"
          "systemd-cryptsetup@NIXROOT.service"
        ];
        before = ["sysroot.mount"];
        unitConfig.DefaultDependencies = "no";
        serviceConfig.Type = "oneshot";
        script = wipeScript;
      };
    };
    environment.persistence."/persist" = {
      directories = [
        "/var/lib/systemd"
        "/var/lib/nixos"
        "/var/log"
        "/srv"
      ];
    };
    programs.fuse.userAllowOther = true;
    system.activationScripts.persistent-dirs.text = let
      mkHomePersist = user:
        lib.optionalString user.createHome
        /*
        sh
        */
        ''
          mkdir -p /persist/${user.home}
          chown ${user.name}:${user.group} /persist/${user.home}
          chmod ${user.homeMode} /persist/${user.home}
        '';
      users = lib.attrValues config.users.users;
    in
      lib.concatLines (map mkHomePersist users);
  };
}
