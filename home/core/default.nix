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
      media = {
        playerctl.enable = true;
      };
    };

    cli = {
      emulators.kitty.enable = true;
      shells.fish.enable = true;
      multiplexers.zellij.enable = true;

      programs = {
        bat.enable = true;
        direnv.enable = true;
        duf.enable = true;
        dust.enable = true;
        eza.enable = true;
        fd.enable = true;
        fzf.enable = true;
        git.enable = true;
        gpg.enable = true;
        ripgrep.enable = true;
        ssh.enable = true;
        yazi.enable = true;
        zoxide.enable = true;
      };
    };
  };
}
