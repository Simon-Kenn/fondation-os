{ config, lib, ...}:
with lib; let 
	cfg = config.hm.cli.programs.zellij;
in {
	options.hm.cli.programs.zellij = {
		enable = mkEnableOption "Enable zellij";
	};

	config = mkIf cfg.enable {
		programs.zellij = {
			enable = true;
		};

		xdg.configFile = {
			"zellij/config.kdl".source = ./config.kdl;
		};
	};
}
