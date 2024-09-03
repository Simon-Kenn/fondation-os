{
  lib,
  config,
  pkgs,
  inputs,
  ...
}:
with lib; let
  cfg = config.fdn.desktops.hyprland;
in {

  options.fdn.desktops.hyprland = {
    enable = mkEnableOption "Enable hyprland desktops";
  };

  config =
    mkIf cfg.enable {
      xdg.portal = {
        enable = true;
        xdgOpenUsePortal = true;
        config = {
          common.default = ["gtk"];
          hyprland.default = ["gtk" "hyprland"];
        };

        extraPortals = [
          pkgs.xdg-desktop-portal-gtk
        ];
      };

      programs.hyprland = {
        enable = true;

        package = inputs.hyprland.packages.${pkgs.system}.default;
        portalPackage = inputs.hyprland.packages.${pkgs.system}.xdg-desktop-portal-hyprland;
      };

      environment.variables.NIXOS_OZONE_WL = "1";
    };
}
