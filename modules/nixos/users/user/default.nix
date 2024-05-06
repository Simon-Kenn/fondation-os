{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.fdn.users.user;
in {
  #imports = [../home-manager];

  options.fdn.user = {
    enable = mkEnableOption "Enable system users";
    name = mkOption {
      type = str;
      desc = "The username to use";
      default = "leto";
    };
    initiallPassword = mkOption {
      type = str;
      desc = "The initiallPassword to use";
      default = "1";
    };
  };

  config = mkIf cfg.enable {
    users.users.${cfg.name} = {
      isNormalUser = true;
      shell = pkgs.fish;
      home = "/home/${cfg.name}";
      extraGroups = ["wheel" "network" "git"];
    };

    security.pam.services = {
      swaylock = {};
    };
  };
}
