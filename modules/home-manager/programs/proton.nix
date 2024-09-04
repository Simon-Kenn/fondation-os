{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.fdn.programs.proton;
in {
  options.fdn.programs.proton = {
    enable = mkEnableOption "proton";
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      protonmail-bridge
      protonmail-desktop
    ];
  };
}
