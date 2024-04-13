{
	config,
	lib,
	pkgs,
	...
}:
with lib; let
	cfg = config.hm.desktops.wayland.xdg;
in {
	options.hm.desktops.wayland.xdg = {
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
