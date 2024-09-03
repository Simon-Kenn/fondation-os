{ inputs, pkgs, ...}: {
  imports = [
    ../programs
    ../wayland
    ../ui
    ../gaming
    ../terminals/kitty.nix

    ./settings.nix

    ./config.nix
    ./workspaces.nix
    ./keymaps-global.nix
    ./keymaps-app.nix
  ];

  wayland.windowManager.hyprland = {
    enable = true;

    package = inputs.hyprland.packages.${pkgs.system}.default;
  };
}
