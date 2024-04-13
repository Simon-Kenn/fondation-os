{
	config,
	lib,
	...
}:
with lib; let
	cfg = config.desktops.wayland.xdg;
in {
	options.desktops.wayland.xdg = {
		enable = mkEnableOption "Enable xdg";
	};

	config = mkIf cfg.enable {
		xdg = {
			autostart.enable = true;
			portal = {
				enable = true;
				extraPortals = with pkgs; [
					xdg-desktop-portal-hyprland
				];
			};
    };
  };
}
