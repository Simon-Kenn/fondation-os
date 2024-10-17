{
  config,
  lib,
  outputs,
  pkgs,
  ...
}:
with lib; let
  cfg = config.fdn.system.nix;
in {
  options.fdn.system.nix = {
    enable = mkEnableOption "nix";
  };

  config = mkIf cfg.enable {
    nixpkgs = {
      overlays = builtins.attrValues outputs.overlays;
      config = {
        allowUnfree = true;
        allowUnfreePredicate = _:true;
        permittedInsecurePackages = [
          "jitsi-meet-1.0.8043"
        ];
      };
    };
  
    nix = {
      package = lib.mkDefault pkgs.nix;
      settings = {
        experimental-features = [
          "nix-command"
          "flakes"
        ];
        warn-dirty = false;
      };
    };
  };
}
