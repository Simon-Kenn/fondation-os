{inputs, outputs, ...}: {
  imports = [
    inputs.nix-colors.homeManagerModule
    ../optionnal/desktops/hyprland
  ] ++ (builtins.attrValues outputs.homeManagerModules);

  # TODO: this belong tho fdn.theme
  wallpaper = ../../pkgs/wallpapers/wallpapers/girl_and_cat.jpg;
  colorScheme = inputs.nix-colors.colorSchemes.catppuccin-mocha;

  fdn = {
    programs  = {

      wayland = {
        hyprlock.enable = true;
        waybar.enable = true;
        wofi.enable = true;
      };

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
      wayland = {
        hyprpaper.enable = true;
      };
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
        packages.enable = true;
        ripgrep.enable = true;
        ssh.enable = true;
        yazi.enable = true;
        zoxide.enable = true;
      };
    };

    editors.nvim.enable = true;

    system = {
      home-manager = {
        enable = true;
        username = "leto";
      };
      impermanence.enable = true;
      nix.enable = true;
      xdg.enable = true;
    };

    themes = {
      catppuccin.enable = true;
    };
  };
}
