{
	inputs,
	lib,
	config,
	pkgs,
	...
}:
with lib; let 
	cfg = config.hm.desktops.programs.steam;
in {
	options.hm.desktops.programs.steam = {
		enable = mkEnableOption "enable steam programs";
	};


	config = mkIf cfg.enable {
	};
}
