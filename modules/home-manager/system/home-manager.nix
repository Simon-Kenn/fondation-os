{
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.fdn.system.home-manager;
in {
  options.fdn.system.home-manager = {
    enable = mkEnableOption "home-manager";

    username = mkOption {
      type = types.str;
      description = "The username to use";
      default = "leto";
    };
  };

  config = mkIf cfg.enable {
    systemd.user.startServices = "sd-switch";
    programs.home-manager.enable = true;

    home = {
      username = lib.mkDefault cfg.username;
      homeDirectory = lib.mkDefault "/home/${cfg.username}";
      stateVersion = lib.mkDefault "24.05";
    };
  };
}
