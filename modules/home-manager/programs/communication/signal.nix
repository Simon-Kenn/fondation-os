{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.fdn.programs.communication.signal;
in {
  options.fdn.programs.communication.signal = {
    enable = mkEnableOption "signal";
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      signal-desktop
    ];
  
    home.persistence."/persist/home/leto".directories = [
      ".config/Signal"
    ];
  };
}
