{
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.fdn.programs.bat;
in {
  options.fdn.programs.bat = {
    enable = mkEnableOption "bat";
  };

  config = mkIf cfg.enable {
    programs.direnv = {
      enable = true;
      nix-direnv.enable = true;
    };
  };
}
