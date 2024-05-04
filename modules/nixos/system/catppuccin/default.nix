{
  config,
  lib,
  inputs,
  ...
}:
with lib; let
  cfg = config.fdn.system.catppuccin;
in {
  imports = [
    inputs.catppuccin.nixosModules.catppuccin
  ];
  options.fdn.system.catppuccin = {
    enable = mkEnableOption "Enable catppuccin";
  };

  config = mkIf cfg.enable {
    catppuccin = {
      enable = true;
      flavour = "mocha";
    };
  };
}
