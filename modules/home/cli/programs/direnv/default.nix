{ config, lib, ...}:
with lib; let 
	cfg = config.hm.cli.programs.direnv;
in {
	options.hm.cli.programs.direnv = {
		enable = mkEnableOption "Enable direnv";
	};

	config = mkIf cfg.enable {
		programs.direnv = {
			enable = true;
			nix-direnv.enable = true;
		};
	};
}
