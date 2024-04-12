{ config, lib, pkgs, ...}:
with lib; let 
	cfg = config.hm.cli.programs.ripgrep;
in {
	options.hm.cli.programs.ripgrep = {
		enable = mkEnableOption "Enable ripgrep";
	};

	config = mkIf cfg.enable {
		programs.ripgrep = {
			enable = true;
		};
	};
}
