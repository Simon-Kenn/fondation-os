{
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.fdn.cli.programs.git;
in {
  options.fdn.cli.programs.git = {
    enable = mkEnableOption "git";
  };

  config = mkIf cfg.enable {
    programs.git = {
      enable = true;
      userName = "Simon-Kenn";
      userEmail = "simon.kenn.public@pm.me";
  
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
        user.signing.key = "C475 3B73 2FA6 1CAD C7E5  D79B F106 DA7D 4657 D8C9";
      };
    };
  };
}
