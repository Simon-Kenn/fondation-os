{ config, lib, ...}:
with lib; let 
	cfg = config.hm.cli.programs.starfish;
in {
	options.hm.cli.programs.starfish = {
		enable = mkEnableOption "Enable starfish";
	};

	config = mkIf cfg.enable {
		programs.starfish = {
			enable = true;
			enableFishIntegration = true;
		};
	};
}
