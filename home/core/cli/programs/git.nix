{
  programs.git = {
    enable = true;
    userName = "Leto";
    userEmail = "leto@fondation.org";

    delta = {
      enable = true;
      options = {
        navigate = true;
      };
      catppuccin.enable = true;
    };

    extraConfig = {
      core = {
        editor = "nvim";
      };
      merge.conflictstyle = "diff3";
      diff.colorMoved = "default";
    };
  };
}
