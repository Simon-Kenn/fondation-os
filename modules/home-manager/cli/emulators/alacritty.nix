{
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.fdn.cli.emulators.alacritty;
in {
  options.fdn.cli.emulators.alacritty = {
    enable = mkEnableOption "alacritty";
  };

  config = mkIf cfg.enable {
    home.sessionVariables = {
      TERMINAL = "alacritty";
    };
    programs.alacritty = {
      enable = true;
      catppuccin.enable = true;

      settings = {
        window = {
          padding = {
            x = 2;
            y = 2;
          };
        };

        scrolling = {
          history = 10000;
          multiplier = 3;
        };

        font = {
          normal = {
            family = config.fdn.themes.fonts.monospace.family;
            style = "Regular";
          };
          size = 11.0;
        };

        bell = {
          animation = "EaseOutExpo";
          duration = 0;
          command = "None";
        };

        #selection = {
        #	save_to_clipboard = false;
        #};
      };
    };
  };
}
