{
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.fdn.cli.programs.zoxide;
in {
  options.fdn.cli.programs.zoxide = {
    enable = mkEnableOption "zoxide";
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
