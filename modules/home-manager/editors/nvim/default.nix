{
  config,
  lib,
  inputs,
  pkgs,
  ...
}:
with lib; let
  cfg = config.fdn.editors.nvim;
in {
  options.fdn.editors.nvim = {
    enable = mkEnableOption "nvim";
  };

  imports = [
    inputs.nixvim.homeManagerModules.nixvim
    ./vbepo.nix
    ./leadermap.nix
    ./colorscheme.nix
    ./options.nix
    ./plugins
  ];


  config = mkIf cfg.enable {
    home = {
      sessionVariables.EDITOR = "nvim";
      persistence."/persist/home/leto".directories = [
        ".local/share/nvim"
        ".vim"
      ];
      packages = with pkgs; [
        # web
        nodePackages.typescript
        bun
        sass
      ];


    };
  
    programs.nixvim = {
      enable = true;
      defaultEditor = true;
      viAlias = true;
      vimAlias = true;
      enableMan = true;
      #package = pkgs.neovim;
    };
  };
}
