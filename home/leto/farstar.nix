{inputs, ...}: {
  imports = [
    inputs.nix-colors.homeManagerModule
    ../core
    ../optionnal/desktops/hyprland
  ];

  wallpaper = ../../pkgs/wallpapers/wallpapers/Kurzgesagt-Cloudy_Quasar_1.png;
  colorScheme = inputs.nix-colors.colorSchemes.catppuccin-mocha;
}
