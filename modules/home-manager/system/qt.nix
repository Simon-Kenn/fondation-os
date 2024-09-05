{
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.fdn.system.qt;
in {
  options.fdn.system.qt = {
    enable = mkEnableOption "qt";
  };

  config = mkIf cfg.enable {
    qt = {
      enable = true;
      platformTheme.name = "kvantum";
      style = {
        name = "kvantum";
        catppuccin = {
          enable = true;
          apply = true;
        };
      };
    };
  };
}
