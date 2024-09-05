{
  config,
  lib,
  inputs,
  pkgs,
  ...
}:
with lib; let
  cfg = config.fdn.programs.wayland.hyprland;
in {
  options.fdn.programs.wayland.hyprland = {
    enable = mkEnableOption "hyprland";
  };
  imports = [
    ./settings.nix
    ./binds.nix
    ./rules.nix
  ];

  config = mkIf cfg.enable {
     home.packages = with pkgs; [
      inputs.hyprland-contrib.packages.${pkgs.system}.grimblast
      grim
      gtk3
      imv # image viewer for x11/wayland
      pulseaudio
      slurp # Select a region in a wayland compositor
      waypipe # Proxy for wayland client
      wf-recorder # Screen recording
      wl-clipboard # Command line copy / paste utility
      wl-mirror
      xdg-utils
    ];

    wayland.windowManager.hyprland = {
      enable = true;

      package = inputs.hyprland.packages.${pkgs.system}.default;
    };
     
  };
}
