{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.fdn.programs.media.sublime-music;
in {
  options.fdn.programs.media.sublime-music = {
    enable = mkEnableOption "sublime-music";
  };

  config = mkIf cfg.enable {
    home.packages = [pkgs.sublime-music];
    home.persistence = {
      "/persist/home/leto".directories = [".config/sublime-music"];
    };
  };
}
