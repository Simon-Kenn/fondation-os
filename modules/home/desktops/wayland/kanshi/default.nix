{
  pkgs,
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.hm.desktops.wayland.kanshi;
in {
  options.hm.desktops.wayland.kanshi = {
    enable = mkEnableOption "Enable kanshi display addon";
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      kanshi
    ];

    services.kanshi = {
      enable = true;
      package = pkgs.kanshi;
      systemdTarget = "";
      profiles = {
        home = {
          outputs = [
            {
              criteria = "edP-1";
              scale = 1.0;
              status = "disable";
            }
            {
              criteria = "HDMI-A-2";
              mode = "1920x1080";
            }
          ];
        };
        default = {
          outputs = [
            {
              criteria = "edP-1";
              scale = 1.0;
              status = "enable";
            }
          ];
        };
      };
    };
  };
}

