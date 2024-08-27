{inputs, ...}: {
  imports = [
    inputs.nix-colors.homeManagerModule
    ../core
    ../optionnal/desktops/hyprland
  ];

  wallpaper = ../../pkgs/wallpapers/wallpapers/girl_and_cat.jpg;
  colorScheme = inputs.nix-colors.colorSchemes.catppuccin-mocha;
}
