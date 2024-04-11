{
	config, lib, ...
}: 
with lib; let 
	cfg = hm.desktops.hyprland;
in {

	imports = [
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

	};
}
