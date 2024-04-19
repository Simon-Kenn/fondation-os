{
  lib,
  pkgs,
  ...
}: {
  wayland.windowManager.hyprland.settings = {
    bind = let
      grimblast = lib.getExe pkgs.grimblast;
    in [
      "SUPER,Return,exec, alacritty"
      "SUPER,space,exec,wofi -S drun"
      "SUPER,h,exec,wofi -S run"
      "SUPER,l,exec,swaylock --grace 0 --fade-in 0"

      # Screenshooting
      ",print,exec,${grimblast} --notify --freeze copy output"
      "SUPER,print,exec,${grimblast} --notify --freeze copy area"
    ];
  };
}
