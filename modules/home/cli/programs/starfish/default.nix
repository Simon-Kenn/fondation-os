{ config, lib, ...}:
with lib; let 
	cfg = config.hm.cli.programs.starship;
in {
	options.hm.cli.programs.starship = {
		enable = mkEnableOption "Enable starship";
	};

	config = mkIf cfg.enable {
		programs.starship = {
			enable = true;
			enableFishIntegration = true;
		};
	};
}
