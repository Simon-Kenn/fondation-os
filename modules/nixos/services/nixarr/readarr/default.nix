{
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.fdn.services.nixarr.readarr;
  defaultPort = 8787;
  nixarr = config.fdn.services.nixarr;
in {
  options.fdn.services.nixarr.readarr = {
    enable = mkEnableOption "the readarr service.";

    stateDir = mkOption {
      type = types.path;
      default = "${nixarr.stateDir}/readarr";
    };
  };

  config = mkIf cfg.enable {
    services.readarr = {
      enable = cfg.enable;
      user = "readarr";
      group = "media";
      openFirewall = true;
      dataDir = cfg.stateDir;
    };
  };
}
