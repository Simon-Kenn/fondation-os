{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.fdn.cli.programs.packages;
in {
  options.fdn.cli.programs.packages = {
    enable = mkEnableOption "packages";
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      feh
      fd
      unzip
    ];
  };
}
