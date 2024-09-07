{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.fdn.cli.shells.fish;
in {
  options.fdn.cli.shells.fish = {
    enable = mkEnableOption "fish";
  };

  config = mkIf cfg.enable {
    programs.fish = {
      enable = true;
      catppuccin.enable = true;

      interactiveShellInit = ''
        set -g greeting
        if test "$TERM" != dumb
          eval (${pkgs.starship}/bin/starship init fish)
        end
      '';

      functions = {
        greeting =  '''';

        fish_vi_bepo_key_bindings = 
          builtins.readFile ./functions/fish_vi_bepo_key_bindings.fish;
      };
  
      shellAbbrs = {
        vim = "nvim";
        vi = "nvim";
        v = "nvim";
  
        cd = "z";
        cdi = "zi";
        grep = "rg";
        cat = "bat";
  
        ls = "eza";
        sl = "eza";
        l = "eza --group --header --group-directories-first --long --git --all --binary --all --icons";
        tree = "eza  --tree";
  
        n = "nix";
        nd = "nix develop";
        ns = "nix shell";
        nsn = "nix shell nixpkgs#";
        nb = "nix build";
        nbn = "nix build nixpkgs#";
  
        nfu = "nix flake update";
        hms = "home-manager switch --flake ~/Codes/fondation#leto@farstar";
        hmr = "home-manager generations | fzf --tac --no-sort | awk '{print $7} | xargs -I{} bash{}/activate";
        nrs = "sudo nixos-rebuild switch --flake ~/Codes/fondation#farstar";
      };
    };
  
    home.persistence."/persist/home/leto".directories = [
      ".local/share/fish"
    ];
  };
}
