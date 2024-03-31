{
	options,
	config,
	lib,
	...
}: 
with lib; let 
	cfg = config.modules.system.locale;
in {
	options.modules.system.locale = {
		enable = mkEnableOption "Wheter or not to manage locale settings.";
	};

	config = mkIf cfg.enable {
		i18n = {
			defaultLocale = "fr_FR.UTF-8";
		};
		time.timeZone = "Europe/Paris";

		#services.xserver.xkb = {
		#	layout = "fr";
		#	variant = "bepo";
		#};

		#console.keyMap = "fr-bepo";
	};
}
