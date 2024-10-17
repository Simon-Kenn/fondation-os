{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.fdn.editors.neovim;
in {
  options.fdn.editors.neovim = {
    enable = mkEnableOption "neovim";
  };

  config = mkIf cfg.enable {
    #TODO: change this when config is completely set to lua

    programs.neovim = {
      enable = true;
      defaultEditor = true;
      vimAlias = true;
      viAlias = true;
      vimDiffAlias = true;

      extraPackages = with pkgs; [
        # LSP
        #lua-language-server
        #rust-analyzer
        #nodePackages.typesrcipt-language-server
      ];

      plugins = with pkgs.vimPlugins; [
    
      ];
    };
  };
}
