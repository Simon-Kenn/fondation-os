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
      yubikey-manager
      yubikey-personalization
    ];

    services = {
      pcscd.enable = true;
      udev.packages = with pkgs; [yubikey-personalization];
    };
    #environment.sellInit =
    #  /*
    #  sh
    #  */
    #  ''
    #    gpg-connect-agent /bye
    #    export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
    #  '';
  };
}
