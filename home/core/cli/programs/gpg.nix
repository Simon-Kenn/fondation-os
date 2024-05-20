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
  home.packages = [pkgs.gnome.seahorse];

  services.gnome-keyring.enable = true;

  services.gpg-agent = {
    enable = true;
    pinentryPackage = pkgs.pinentry-gnome3;
    enableSshSupport = true;
    enableExtraSocket = true;
  };

  programs = {
    fish.loginShellInit = startGpgAgent;

    gpg = {
      enable = true;
      publicKeys = [
        {
          source = ../../../leto/pub.asc;
          trust = 5;
        }
      ];
    };
  };
}
