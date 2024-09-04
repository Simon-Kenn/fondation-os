{
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.fdn.cli.programs.direnv;
in {
  options.fdn.cli.programs.direnv = {
    enable = mkEnableOption "direnv";
  };

  config = mkIf cfg.enable {
    programs.direnv = {
      enable = true;
      nix-direnv.enable = true;
    };
  };
}
