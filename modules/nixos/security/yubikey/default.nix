{
  lib,
  inputs,
  pkgs,
  ...
}:
with lib; let
  cfg = fdn.security.yubikey;
in {
  options.fdn.security.yubikey = {
    imports = [inputs.sops-nix.nixosModules.sops];
    enable = mkEnableOption "Enable yubikey";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [libfido2];
  };
}
