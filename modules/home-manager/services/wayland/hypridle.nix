{
  config,
  lib,
  ...
}:
with lib; let 
  cfg = config.fdn.services.wayland.hypridle;
in {
  options.fdn.services.wayland.hypridle = {
    enable = mkEnableOption "hypridle";
  };

  config = mkIf cfg.enable {
    services.hypridle = {
      enable = true;
      settings = {
        general = {
          before_sleep_cmd = "loginctl lock-session";
          after_sleep_cmd = "hyprctl dispatch dpms on";
          lock_cmd = "pidof hyprlock || hyprlock";
        };

        listener = [
          {
            timeout = 300;
            on-timeout = "loginctl lock-session";
          }
          {
            timeout = 330;
            on-timeout = "hyrctl dispatch dpms off";
            on-resume = "hyprctl dispatch dpms on";
          }
          {
            timeout = 1800;
            on-timeout = "systemctl suspend"; # TODO: should i use ? 
          }
        ];
      };
    };
  };
}
