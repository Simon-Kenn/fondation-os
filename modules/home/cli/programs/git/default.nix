{ config, lib, ...}:
with lib; let 
	cfg = config.hm.cli.programs.git;
in {
	options.hm.cli.programs.git = {
		enable = mkEnableOption "Enable git";
	};

	config = mkIf cfg.enable {
		programs.git = {
			enable = true;
			userName = "Leto";
			userEmail = "leto@fondation.org";
		};
	};
}
