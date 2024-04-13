{ pkgs, ...}: {
	networking.hostName = "farstar";
	system.stateVersion = "24.05";

	imports = [
		./hardware.nix
		./disk.nix
		../../modules/nixos
		../../homes/leto-farstar
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

		hardware = {
			audio.enable = true;
			bluetooth.enable = true;
			networking.enable = true;
			video.enable = true;
		};

		network = {
			#openssh.enable = true;
		};

		shell.fish.enable = true;
	};
}
