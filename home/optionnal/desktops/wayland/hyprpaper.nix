{inputs, ...}: let
  inherit (inputs) hyprpaper;
in {
  disabledModules = ["services/hyprpaper.nix"];
  imports = [hyprpaper.homeManagerModules.default];

  services.hyprpaper = {
    enable = true;
    preloads = [
      "~/fondation/modules/home/desktops/wayland/hyprpaper/nix-black-4K.png"
    ];
    wallpapers = [", ./nix-black-4K.png"];
  };
}
