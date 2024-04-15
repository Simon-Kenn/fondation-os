{
	networking.hostName = "farstar";
	system.stateVersion = "24.05";

	imports = [
		./hardware.nix
		./disk.nix

    ../common/users/leto

    ../common/systems/base-packages.nix
    ../common/systems/boot.nix
    ../common/systems/ephemeral-btrfs.nix
    ../common/systems/impermanence.nix
    ../common/systems/locale.nix
    ../common/systems/nix.nix
    
    ../common/hardware/audio.nix
    ../common/hardware/video.nix
    ../common/hardware/bluetooth.nix

    ../common/shells/fish.nix

    ../common/networking/network-manager.nix

    ../common/security/sops.nix

    ../common/gaming
	];
}