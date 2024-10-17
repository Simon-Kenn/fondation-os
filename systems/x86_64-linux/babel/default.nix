{outputs, ...}: {
  networking.hostName = "babel";
  system.stateVersion = "24.05";

  imports =
    [
      ./hardware.nix
      ./disk.nix
    ]
    ++ (builtins.attrValues outputs.nixosModules);


  fdn = {
    system = {
      boot = {
        enable = true;
        plymouth = true;
      };
      impermanence.enable = true;
      catppuccin.enable = true;
      locale.enable = true;
      nix.enable = true;
    };

    user = {
      enable = true;
      name = "leto";
      initialPassword = "password";
    };

    security = {
      sops.enable = true;
      yubikey.enable = true;
    };
    shell.fish.enable = true;
    networking.enable = true;

    services = {
      openssh = {
        enable = true;
        PermitRootLogin = "yes";
      };

      homepage-dashboard.enable = true;

      wireguard = {
        enable = true;
      };

      nixarr = {
        enable = true;
        jellyfin.enable = true;
        calibre-web.enable = true;
        sonarr.enable = true;
        bazarr.enable = true;
        lidarr.enable = true;
        prowlarr.enable = true;
        radarr.enable = true;
        readarr.enable = true;
      };

      paperless.enable = true;
    };
  };
}
