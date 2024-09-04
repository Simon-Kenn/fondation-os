{pkgs, ...}: let
  startGpgAgent =
    /*
    bash
    */
    ''
      set -x GPG_TTY (tty)
      set -x SSH_AUTH_SOCK (gpgconf --list-dirs agent-ssh-socket)
      gpgconf --launch gpg-agent
    '';
in {
    home.packages = [pkgs.seahorse];
  
    services.gnome-keyring.enable = true;
  
    services.gpg-agent = {
      enable = true;
      pinentryPackage = pkgs.pinentry-gnome3;
      enableSshSupport = true;
      sshKeys = ["5E8B20D064B3BAF89608A64BDC6BCF810B5857A5"];
      enableExtraSocket = true;
    };
  
    programs = {
      fish.loginShellInit = startGpgAgent;
  
      gpg = {
        enable = true;
        publicKeys = [
          {
            source = ../../../;
            trust = 5;
          }
        ];
      };
    };
}
