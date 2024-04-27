{config, ...}: {
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
          family = config.fontProfiles.monospace.family;
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
}
