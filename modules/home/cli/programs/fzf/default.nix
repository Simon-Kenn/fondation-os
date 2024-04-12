{ config, lib, ...}:
with lib; let 
	cfg = config.hm.cli.programs.fzf;
in {
	options.hm.cli.programs.fzf = {
		enable = mkEnableOption "Enable fzf";
	};

	config = mkIf cfg.enable {
		programs.fzf = {
			enable = true;
			enableFishIntegration = true;
		};
	};
}
