{pkgs, ...}: {
  home.sessionVariables = {
    GPG_TTY = "$(tty)";
  };

  #home.packages = [pkgs.seahorse];

  services.gnome-keyring.enable = true;

  services.gpg-agent = {
    enable = true;
    pinentryPackage = pkgs.pinentry-gnome3;
  };

  programs = {
    gpg = {
      enable = true;
      publicKeys = [
        {
          source = ../../../leto/F106DA7D4657D8C9-2024-05-15.asc;
          trust = 5;
        }
      ];
    };
  };
}
