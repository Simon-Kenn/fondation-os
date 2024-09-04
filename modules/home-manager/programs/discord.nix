{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.fdn.programs.discord;
in {
  options.fdn.programs.discord = {
    enable = mkEnableOption "discord";
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs; [vesktop];

    home.persistence = {
      "/persist/home/leto".directories = [".config/vesktop"];
    };

    xdg.configFile."vesktop/themes/base16.css".text = /* css */ ''
      @import url("https://slowstab.github.io/dracula/BetterDiscord/source.css");
      @import url("https://mulverinex.github.io/legacy-settings-icons/dist-native.css");
    '';
  };
}
