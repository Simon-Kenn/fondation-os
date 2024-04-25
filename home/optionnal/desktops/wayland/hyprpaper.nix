{ inputs, ... }:
let
inherit (inputs) hyprpaper;
in {
  imports = [hyprpaper.homeManagerModules.default];

  services.hyprpaper = {
    enable = true;
    preloads = [
      "~/fondation/modules/home/desktops/wayland/hyprpaper/nix-black-4K.png"
    ];
    wallpapers = [", ./nix-black-4K.png" ];
  };
}
