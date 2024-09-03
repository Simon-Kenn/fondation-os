{ inputs, pkgs, ...}: {
  imports = [
    ../programs
    ../wayland
    ../ui
    ../gaming
    ../terminals/kitty.nix
    ../ags

    ./settings.nix

    #./config.nix
    ./workspaces.nix
    ./keymaps-global.nix
    ./keymaps-app.nix
  ];

  home.packages = [
    inputs.hyprland-contrib.packages.${pkgs.system}.grimblast
  ];

  wayland.windowManager.hyprland = {
    enable = true;

    package = inputs.hyprland.packages.${pkgs.system}.default;
  };
}
