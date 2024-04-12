{ lib, ...}:
{
	imports = [
		../../modules/home
	];

	home = {
		username = "leto";
		homeDirectory = "/home/leto";
		stateVersion = lib.mkDefault "24.05";
	};

	hm = {

		system = {
			nix.enable = true;
			impermanence.enable = true;
		};

		cli = {
			terminals.alacritty.enable = true;

			programs = {
				gpg.enable = true;
				ripgrep.enable = true;
				eza.enable = true;
				bat.enable = true;
			};

		};

		editors = {
			nvim.enable = true;
		};

		desktops = {
			hyprland.enable = true;
		};
	};

	programs.home-manager.enable = true;
	programs.git.enable = true;

	systemd.user.startServices = "sd-switch";
}
