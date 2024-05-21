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
      avahi.enable = true;
      homepage-dashboard.enable = true;
      servarr.enable = true;
    };
  };
}
