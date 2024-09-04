{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.fdn.programs.communication.proton;
in {
  options.fdn.programs.communication.proton = {
    enable = mkEnableOption "proton";
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      protonmail-bridge
      protonmail-desktop
    ];
  };
}
