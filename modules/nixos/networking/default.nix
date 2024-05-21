{
  lib,
  config,
  ...
}: let
  cfg = config.fdn.networking;
in {
  imports = [
    ./networkmanager.nix
    ./wireless.nix
  ];

  options.fdn.networking = {
    enable = lib.mkEnableOption "Enable networking";
    wireless = lib.mkEnableOption "wireless networking";
  };

  config = lib.mkIf cfg.enable {
    networking.firewall.enable = true;
    networkmanager = lib.mkIf (! cfg.wireless) {enable = true;};
    wireless = lib.mkIf cfg.wireless {enable = true;};
  };
  #{
  #  networking = mkMerge [
  #    {
  #      firewall.enable = true;
  #    }
  #    (mkIf (! cfg.wireless) {
  #      networkmanager.enable = true;
  #    })
  #    (mkIf cfg.wireless {
  #      wireless.enable = true;
  #    })
  #  ];
  #};
}
