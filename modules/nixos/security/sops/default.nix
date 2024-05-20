{
  config,
  lib,
  inputs,
  ...
}:
with lib; let
  cfg = config.fdn.security.sops;
in {
  imports = [inputs.sops-nix.nixosModules.sops];

  options.fdn.security.sops = {
    imports = [inputs.sops-nix.nixosModules.sops];
    enable = mkEnableOption "Enable sops";
  };

  config = mkIf cfg.enable {
    sops = {};
  };
}
