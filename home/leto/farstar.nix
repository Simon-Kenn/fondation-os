{inputs, ...}: {
  imports = [
    inputs.nix-colors.homeManagerModule
    ../core
    ../optionnal/desktops/hyprland
  ];

  wallpaper = ../../pkgs/wallpapers/wallpapers/SPOILER_wallpaper.png;
  colorScheme = inputs.nix-colors.colorSchemes.catppuccin-mocha;
}
