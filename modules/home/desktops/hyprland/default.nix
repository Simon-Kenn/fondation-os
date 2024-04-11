{
	config, lib, pkgs, ...
}: 
with lib; let 
cfg = config.hm.desktops.hyprland;
in {

	imports = [
		../ui
		../programs
		../wayland
		./config.nix
		./workspaces.nix
		./keymaps-global.nix
		./keymaps-app.nix
	];

	options.hm.desktops.hyprland = {
		enable = mkEnableOption "enable hyprland window manager";
	};

	config = mkIf cfg.enable {

		wayland.windowManager.hyprland.enable = true;

		desktops = {

			ui = {
				colors.enable = true;
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
			};

			wayland = {
				wofi.enable = true;
			};
		};
	};
}
