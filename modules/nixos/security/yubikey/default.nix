{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.fdn.security.yubikey;
in {
  options.fdn.security.yubikey = {
    enable = mkEnableOption "Enable yubikey";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      libfido2
      yubikey-manager
      pam_u2f
    ];

    services = {
      pcscd.enable = true;
      udev = {
        packages = with pkgs; [yubikey-personalization];
        extraRules = ''
          ACTION=="remove",\
            ENV{ID_BUS}=="usb",\
            ENV{ID_MODEL_ID}=="0407",\
            ENV{ID_VENDOR_ID}=="1050",\
            ENV{ID_VENDOR}=="Yubico",\
            RUN+="${pkgs.systemd}/bin/loginctl lock-sessions"
        '';
      };
      dbus.packages = [pkgs.gcr];
    };


    security.pam = {

      u2f = {
        enable = true;
        settings = {
          #cue = true;
          #cue_prompt = "Prouvez votre existence";
          authfile = ./u2f_keys;
          userpresence = 1;
          userverification = 0;
          pinverification = 1;
        };
      };

      services = {
        hyprlock = {
          u2fAuth = true;
        };
        login = {
          u2fAuth = true;
        };
        sudo = {
          u2fAuth = true;
        };
      };
    };
  };
}
