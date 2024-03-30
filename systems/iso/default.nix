{
  pkgs,
  lib,
	inputs,
  ...
}: {
	imports = [ inputs.home-manager.nixosModules.home-manager ];

  networking = {
    hostName = "iso";
  };

  nixpkgs = {
    hostPlatform = lib.mkDefault "x86_64-linux";
    config.allowUnfree = true;
  };

	console.keyMap = "fr-bepo";

  nix = {
    settings.experimental-features = ["nix-command" "flakes"];
    extraOptions = "experimental-features = nix-command flakes";
  };

  services = {
    qemuGuest.enable = true;
    openssh.settings.PermitRootLogin = lib.mkForce "yes";
		xserver.xkb = {
			layout = "fr";
			variant = "bepo";
		};
  };

  boot = {
    kernelPackages = pkgs.linuxPackages_latest;
    supportedFilesystems = lib.mkForce ["btrfs" "reiserfs" "vfat" "f2fs" "xfs" "ntfs" "cifs"];
  };

  # gnome power settings do not turn off screen
  systemd = {
    services.sshd.wantedBy = pkgs.lib.mkForce ["multi-user.target"];
    targets = {
      sleep.enable = false;
      suspend.enable = false;
      hibernate.enable = false;
      hybrid-sleep.enable = false;
    };
  };

	home-manager.users.nixos = import ./home.nix;
  users.extraUsers.root.password = "nixos";
}
