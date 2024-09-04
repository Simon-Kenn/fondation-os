{
  config,
  lib,
  inputs,
  ...
}:
with lib; let
  cfg = config.fdn.themes.catppuccin;
in {
  options.fdn.themes.catppuccin = {
    enable = mkEnableOption "catppuccin";
  };

  imports = [
    inputs.catppuccin.homeManagerModules.catppuccin
  ];

  config = mkIf cfg.enable {
  
    catppuccin = {
      enable = true;
      flavor = "mocha";
      accent = "blue";
      pointerCursor = {
        enable = true;
      };
    };
  };
}
