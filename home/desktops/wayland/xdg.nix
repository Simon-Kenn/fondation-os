{ pkgs, ...}: {
  xdg = {
    enable = true;
#autostart.enable = true;
    portal = {
      enable = true;
      config = {
        common = {
          default = [
            "gtk"
          ];
        };
      };
      extraPortals = with pkgs; [
        xdg-desktop-portal-hyprland
      ];
    };

    mimeApps.enable = true;
  };
}
