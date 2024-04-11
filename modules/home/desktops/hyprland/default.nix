{
	config, lib, ...
}: 
with lib; let 
	cfg = config.hm.desktops.hyprland;
in {

	imports = [
		../ui
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
			};
		};
	};
}
