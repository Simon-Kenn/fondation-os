{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.fdn.programs.sublime-music;
in {
  options.fdn.programs.sublime-music = {
    enable = mkEnableOption "sublime-music";
  };

  config = mkIf cfg.enable {
    home.packages = [pkgs.sublime-music];
    home.persistence = {
      "/persist/home/leto".directories = [".config/sublime-music"];
    };
  };
}
