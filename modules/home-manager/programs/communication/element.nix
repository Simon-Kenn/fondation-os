{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.fdn.programs.communication.element;
in {
  options.fdn.programs.communication.element = {
    enable = mkEnableOption "element";
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      element-desktop
    ];

    home.persistence."/persist/home/leto".directories = [
      ".config/Element"
    ];
  };
}
