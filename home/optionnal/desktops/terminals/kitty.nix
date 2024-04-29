{config, ...}: {
  home.sessionVariables = {
    TERMINAL = "kitty";
  };
  programs.kitty = {
    enable = true;
    shellIntegration.enableFishIntegration = true;
    catppuccin.enable = true;

    font = {
      name = config.fontProfiles.monospace.family;
      size = 11;
    };

    settings = {
      shell = "fish";
      scrollback_lines = 4000;
      scrollback_pager_history_size = 2048;
      window_padding_width = 3;
      show_hyperlink_targets = "yes";
      enable_audio_bell = false;
      url_style = "none";
      underline_hyperlinks = "never";
    };
  };
}
