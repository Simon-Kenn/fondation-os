{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.fdn.services.nixarr.prowlarr;
  defaultPort = 9696;
  nixarr = config.fdn.services.nixarr;
in {
  options.fdn.services.nixarr.prowlarr = {
    enable = mkEnableOption "the prowlarr service.";

    stateDir = mkOption {
      type = types.path;
      default = "${nixarr.stateDir}/prowlarr";
    };

    user = mkOption {
      type = types.str;
      default = "prowlarr";
    };

    group = mkOption {
      type = types.str;
      default = "media";
    };
  };

  config = mkIf cfg.enable {
    services.prowlarr = {
      enable = cfg.enable;
      openFirewall = true;
    };

    systemd.tmpfiles.rules = [
      "d '${cfg.stateDir}' 0700 ${cfg.user} ${cfg.group} - -"
    ];

    #systemd.services.prowlarr = {
    #  description = "Prowlarr";
    #  after = ["network.target"];
    #  wantedBy = ["multi-user.target"];

    #  serviceConfig = {
    #    Type = "simple";
    #    User = cfg.user;
    #    Group = cfg.group;
    #    #ExecStart = "${lib.getExe pkgs.prowlarr}";
    #    Restart = "on-failure";
    #  };
    #};

    users.users = {
      prowlarr = {
        isSystemUser = true;
        group = cfg.group;
        home = cfg.stateDir;
      };
    };

    users.groups.prowlarr = {};
  };
}
