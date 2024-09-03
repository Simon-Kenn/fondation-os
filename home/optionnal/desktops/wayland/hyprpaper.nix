{ inputs, pkgs, ...}:{
  services.hyprpaper = {
    enable = true;

    package = inputs.hyprpaper.packages.${pkgs.system}.default;


    settings = {
      preloads = [
        "~/fondation/modules/home/desktops/wayland/hyprpaper/girl_and_cat.jpg"
      ];
      wallpapers = [", ./girl_and_cat.jpg"];
    };
  };
}
