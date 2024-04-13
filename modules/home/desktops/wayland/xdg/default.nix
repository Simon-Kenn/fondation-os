{
	config,
	lib,
	pkgs,
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
			enable = true;
			#autostart.enable = true;
			portal = {
				enable = true;
				config = {
					common = {
						default = [
							"gtk"
						];
					};
				};
				extraPortals = with pkgs; [
					xdg-desktop-portal-hyprland
				];
			};
    };
  };
}
