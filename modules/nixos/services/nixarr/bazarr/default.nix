{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.fdn.services.nixarr.bazarr;
  defaultPort = 6767;
  nixarr = config.fdn.services.nixarr;
in {
  options.fdn.services.nixarr.bazarr = {
    enable = mkEnableOption "the bazarr service.";

    stateDir = mkOption {
      type = types.path;
      default = "${nixarr.stateDir}/bazarr";
    };

    user = mkOption {
      type = types.str;
      default = "bazarr";
    };

    group = mkOption {
      type = types.str;
      default = "media";
    };
  };

  config = mkIf cfg.enable {
    services.bazarr = {
      enable = cfg.enable;
      openFirewall = true;
      user = cfg.user;
      group = cfg.group;
      listenPort = defaultPort;
    };

    systemd.tmpfiles.rules = [
      "d '${cfg.stateDir}' 0700 bazarr root - -"
    ];

    #systemd.services.bazarr = {
    #  description = "bazarr";
    #  after = ["network.target"];
    #  wantedBy = ["multi-user.target"];

    #  serviceConfig = {
    #    Type = "simple";
    #    User = cfg.user;
    #    Group = cfg.group;
    #    SyslogIdentifier = "bazarr";
    #    #ExecStart = "${lib.getExe pkgs.bazarr}";
    #    Restart = "on-failure";
    #  };
    #};
  };
}
