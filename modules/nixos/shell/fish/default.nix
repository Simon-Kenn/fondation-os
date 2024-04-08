{ config, lib, ...}:
with lib; let 
	cfg = config.os.shell.fish;
in {
	options.os.shell.fish = {
		enable = mkEnableOption "Enable fish";
	};

	config = mkIf cfg.enable {
		programs.fish = {
			enable = true;
			vendor = {
				completions.enable = true;
				config.enable = true;
				functions.enable = true;
			};
		};
	};
}
