{
	inputs,
	lib,
	config,
	pkgs,
	...
}:
with lib; let 
	cfg = config.hm.desktops.programs.discord;
in {
	options.hm.desktops.programs.discord = {
		enable = mkEnableOption "enable discord browser";
	};

	config = mkIf cfg.enable {

    home.packages = with pkgs; [vesktop];

    home.persistence = {
      "/persist/home/leto".directories = [".config/vesktop"];
    };

    xdg.configFile."vesktop/themes/base16.css".text =
      /*
      css
      */
      ''
        @import url("https://slowstab.github.io/dracula/BetterDiscord/source.css");
        @import url("https://mulverinex.github.io/legacy-settings-icons/dist-native.css");
      '';
    
	};
}
