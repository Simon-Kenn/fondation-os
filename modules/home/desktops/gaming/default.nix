{
  config,
  pkgs,
  lib,
  ...
}:
with lib; let
  cfg = config.hm.desktops.gaming;
in {
  options.hm.desktops.gaming = {
    enable = mkEnableOption "Whether or not to manage gaming configuration";
  };

  config = mkIf cfg.enable {
    programs.mangohud = {
      enable = true;
      enableSessionWide = true;
      settings = {
        cpu_load_change = true;
      };
    };

    home.packages = with pkgs; [
      lutris
      bottles
      adwsteamgtk
      steam
    ];
  };
}
