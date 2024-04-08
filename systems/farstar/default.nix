{
	networking.hostName = "farstar";
	system.stateVersion = "24.05";

	imports = [
		./hardware.nix
		./disk.nix
		../../modules/nixos
	];

	os = {
		system = {
			ephemeral-btrfs.enable = true;
			impermanence.enable = true;
			systemd-boot.enable = true;
			nix.enable = true;
			locale.enable = true;
			base-packages.enable = true;
		};

		network = {
			network-manager.enable = true;
			openssh.enable = true;
		};

		shell.fish.enable = true;
	};
}
