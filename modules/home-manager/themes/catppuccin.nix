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

  config = mkIf cfg.enable {
    imports = [
      inputs.catppuccin.homeManagerModules.catppuccin
    ];
  
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
