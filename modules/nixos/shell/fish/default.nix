{
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.fdn.shell.fish;
in {
  options.fdn.shell.fish = {
    enable = mkEnableOption "Enable fish shell";
  };

  config = mkIf cfg.enable {
    programs.fish = {
      enable = true;
      vendor = {
        completions.enable = true;
        config.enable = true;
        functions.enable = true;
      };
    };
  };
}
