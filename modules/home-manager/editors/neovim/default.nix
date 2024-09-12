{
  config,
  lib,
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

    #programs.neovim = {
    #  
    #};
  };
}
