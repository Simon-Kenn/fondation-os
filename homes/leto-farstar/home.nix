{ lib, pkgs, ...}:
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
			shells.fish.enable = true;

			programs = {

				gpg.enable = true;
				ripgrep.enable = true;
				eza.enable = true;
				bat.enable = true;
				direnv.enable = true;
				fzf.enable = true;
				starship.enable = true;
				zoxide.enable = true;
				yazi.enable = true;
				zellij.enable = true;

			};

		};

		editors = {
			nvim.enable = true;
		};

		desktops = {
			hyprland.enable = true;

			wayland = {
				wofi.enable = true;
				waybar.enable = true;
				xdg.enable = true;
				hyprpaper.enable = true;
				swaync.enable = true;
			};

			ui = {
				gtk.enable = true;
				colors.enable = true;
				qt.enable = true;
				fontProfiles = { 

					enable = true;
					monospace = {
						family = "FiraCode Nerd Font";
						package = pkgs.nerdfonts.override {fonts = ["FiraCode"];};
					};
					regular = {
						family = "Fira Sans";
						package = pkgs.fira;
					};
				};
			};

			programs = {
				browsers.firefox.enable = true;
        discord.enable = true;
			};

      gaming.enable = true;
		};
	};

	programs.home-manager.enable = true;

	systemd.user.startServices = "sd-switch";
}
