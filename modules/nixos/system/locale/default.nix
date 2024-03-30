{
	config,
	lib,
	...
}: 
with lib; let 
	cfg = config.system.locale;
in {
	options.system.locale = with types; {
		enable = mkBoolOpt false "Wheter or not to manage locale settings.";
	};

	config = mkIf cfg.enable {
		i18n = {
			defaultLocale = lib.mkDefault "fr_FR.UTF-8";
		};
		time.timeZone = "Europe/Paris";
	};

	services.xserver.xkb = {
		layout = "fr";
		variant = "bepo";
	};

	console.keyMap = "fr-bepo";
}
