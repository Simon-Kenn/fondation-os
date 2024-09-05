{
  config,
  lib,
  inputs,
  pkgs,
  ...
}:
with lib; let
  cfg = config.fdn.services.wayland.ags;
in {
  options.fdn.services.wayland.ags = {
    enable = mkEnableOption "ags";
  };

  imports = [ inputs.ags.homeManagerModules.default ];

  config = mkIf cfg.enable {
    programs.ags = {
      enable = true;

      configDir = ../ags;

      extraPackages = with pkgs; [
        gtksourceview
        webkitgtk
        accountsservice
      ];
    };
  };
}
