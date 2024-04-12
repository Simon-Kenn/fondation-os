{
	config,
	lib,
	...
}:
with lib; let
	cfg = config.desktops.wayland.waybar;
in {
	options.desktops.wayland.waybar = {
		enable = mkEnableOption "Enable waybar";
	};

	config = mkIf cfg.enable {
		programs.waybar = {
     enable = true;
    };
  };
}
