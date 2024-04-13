	{ config, lib, ...}:
with lib; let 
	cfg = config.hm.cli.programs.zoxide;
in {
	options.hm.cli.programs.zoxide = {
		enable = mkEnableOption "Enable zoxide";
	};

	config = mkIf cfg.enable {
		programs.zoxide = {
			enable = true;
			enableFishIntegration = true;
		};
	};
}
