{
  lib,
  outputs,
  ...
}: {
  imports =
    [
      ./nix.nix
      ./impermanence.nix
      ./cli
      ./nvim
      ./catppuccin.nix
    ]
    ++ (builtins.attrValues outputs.homeManagerModules);

  systemd.user.startServices = "sd-switch";
  programs.home-manager.enable = true;

  home = {
    username = lib.mkDefault "leto";
    homeDirectory = lib.mkDefault "/home/leto";
    stateVersion = lib.mkDefault "24.05";
  };

  fdn = {
    programs  = {
      browsers = {
        firefox.enable = true;
      };

      communication = {
        discord.enable = true;
        element.enable = true;
        signal.enable = true;
      };

      media = {
        calibre.enable = true;
        mpv.enable = true;
        pavucontrol.enable = true;
      };

      office = {
        anki.enable = true;
        libre-office.enable = true;
      };
    };

    services = {
      playerctl.enable = true;
    };
  };
}
