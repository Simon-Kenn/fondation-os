{
  pkgs,
  lib,
  inputs,
  outputs,
  ...
}: {
	imports = [ 
		inputs.home-manager.nixosModules.home-manager 
    ../common/systems/locale.nix
    ../common/systems/nix.nix
	];

	users.extraUsers.root.password = "nixos";
	users.users.nixos = {
		packages = [ pkgs.home-manager ];
	};

	home-manager.users.nixos = import ./home.nix;
	home-manager.extraSpecialArgs = { inherit inputs outputs; };

  networking = {
    hostName = "iso";
  };

  nix = {
    settings.experimental-features = ["nix-command" "flakes"];
    extraOptions = "experimental-features = nix-command flakes";
  };

  services = {
    qemuGuest.enable = true;
    openssh.settings.PermitRootLogin = lib.mkForce "yes";
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
}
