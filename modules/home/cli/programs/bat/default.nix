{ config, lib, pkgs, ...}:
with lib; let 
	cfg = config.hm.cli.programs.bat;
in {
	options.hm.cli.programs.bat = {
		enable = mkEnableOption "Enable bat";
	};

	config = mkIf cfg.enable {
		programs.bat = {
			enable = true;
		};
	};
}
