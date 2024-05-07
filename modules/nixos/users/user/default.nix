{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.fdn.user;
in {
  #imports = [../home-manager];

  options.fdn.user = {
    enable = mkEnableOption "Enable system users";
    name = mkOption {
      type = types.str;
      description = "The username to use";
      default = "leto";
    };
    initialPassword = mkOption {
      type = types.str;
      description = "The initiallPassword to use";
      default = "1";
    };
  };

  config = mkIf cfg.enable {
    users.users.${cfg.name} = {
      isNormalUser = true;
      shell = pkgs.fish;
      home = "/home/${cfg.name}";
      extraGroups = ["wheel" "network" "git"];
      initialPassword = cfg.initialPassword;
    };

    security.pam.services = {
      swaylock = {};
    };
  };
}
