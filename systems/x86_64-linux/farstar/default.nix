{outputs, ...}: {
  networking.hostName = "farstar";
  system.stateVersion = "24.05";

  imports =
    [
      ./disk.nix
      ./hardware.nix
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
      home-manager.enable = true;
    };

    security = {
      sops.enable = true;
      yubikey.enable = true;
    };

    shell.fish.enable = true;

    networking = {
      enable = true;
    };

    hardware = {
      audio.enable = true;
      video.enable = true;
      bluetooth.enable = true;
    };

    services = {
      openssh.enable = true;
    };

    gaming.enable = true;
  };
}
