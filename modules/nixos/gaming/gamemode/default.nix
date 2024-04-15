{ config, lib, pkgs, ...}:
with lib; let 
	cfg = config.os.gaming.gamemode;
in {

	options.os.gaming.gamemode = {
		enable = mkEnableOption "Enable gamemode";
	};

	config = mkIf cfg.enable {
    programs.gamemode.enable = true;
	};
}
