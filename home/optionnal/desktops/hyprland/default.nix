{
  imports = [
    ../programs
    ../wayland
    ../ui
    ../gaming
    ../terminals/kitty.nix

    ./config.nix
    ./workspaces.nix
    ./keymaps-global.nix
    ./keymaps-app.nix
  ];

  wayland.windowManager.hyprland.enable = true;
}
