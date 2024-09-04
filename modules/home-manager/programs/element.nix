{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.fdn.programs.element;
in {
  options.fdn.programs.element = {
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
