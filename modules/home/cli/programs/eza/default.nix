{ config, lib, pkgs, ...}:
with lib; let 
	cfg = config.hm.cli.programs.eza;
in {
	options.hm.cli.programs.eza = {
		enable = mkEnableOption "Enable eza";
	};

	config = mkIf cfg.enable {
		programs.eza = {
			enable = true;
		};
	};
}
