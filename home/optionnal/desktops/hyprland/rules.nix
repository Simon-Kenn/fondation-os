{
  wayland.windowManager.hyprland.settings = {
    monitor = [
      "eDP-1, 1920x1080@60, 0x0, 1"
      "DP-1, 1920x1080@60, 1920x0, 1"
      "HDMI-A-2, 1920x1080@60, 3840x0, 1"
    ];

    windowrulev2 = [
      "float, class:Wofi"
      "float, class:notification"
      "float, class:download"
      "float, class:dialog"
      "float, class:error"
      "float, title:^(Media viewer)$"
      "float, title:^(.*Bitwarden Password Manager.*)$"
    ];
  };
}
