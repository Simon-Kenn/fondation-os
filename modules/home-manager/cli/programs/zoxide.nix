{
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.fdn.cli.programs.yazi;
in {
  options.fdn.cli.programs.yazi = {
    enable = mkEnableOption "yazi";
  };

  config = mkIf cfg.enable {
    programs.zoxide = {
      enable = true;
      enableFishIntegration = true;
    };
  
    home.persistence."/persist/home/leto".directories = [
      ".local/share/zoxide"
    ];
  };
}
