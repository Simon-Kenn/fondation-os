{
  programs.fish = {
    enable = true;
    catppuccin.enable = true;

    shellAbbrs = {
      vim = "nvim";
      n = "nvim";
      cd = "z";
      cdi = "zi";
      grep = "rg";
      cat = "bat";
      ls = "eza";
      sl = "eza";
      l = "eza --group --header --group-directories-first --long --git --all --binary --all --icons";
      tree = "eza  --tree";

      nd = "nix develop";
      nfu = "nix flake update";
      hms = "home-manager switch --flake ~/Codes/fondation#leto@farstar";
      hmr = "home-manager generations | fzf --tac --no-sort | awk '{print $7} | xargs -I{} bash{}/activate";
      nrs = "sudo nixos-rebuild switch --flake ~/Codes/fondation#farstar";
    };

    functions = {
      fish_greeting = '''';
    };
  };

  home.persistence."/persist/home/leto".directories = [
    ".local/share/fish"
  ];
}
