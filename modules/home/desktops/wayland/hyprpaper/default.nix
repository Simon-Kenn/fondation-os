{
  inputs,
  config,
  lib,
  ...
}:
with lib;
let
  cfg = config.hm.desktops.wayland.hyprpaper;
  inherit (inputs) hyprpaper;
in {
  imports = [hyprpaper.homeManagerModules.default];

  options.hm.desktops.wayland.hyprpaper = {
    enable = lib.mkEnableOption "Whether to enable the hyprpaper config";
  };

  config = mkIf cfg.enable {
    services.hyprpaper = {
      enable = true;
      preloads = [
				"./nix-black-4K.png"
      ];
      wallpapers = [", ./nix-black-4K.png" ];
    };
  };
}
