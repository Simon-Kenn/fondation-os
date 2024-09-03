{ inputs, pkgs, config, ...}:{
  services.hyprpaper = {
    enable = true;
    package = inputs.hyprpaper.packages.${pkgs.system}.default;

    settings = {
      preloads = ["${config.wallpaper}"];
      wallpapers = [", ${config.wallpaper}"];
    };
  };
}
