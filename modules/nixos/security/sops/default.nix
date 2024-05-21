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
    sops = {
      defaultSopsFile = ../../secrets.yaml;
      age.sshKeyPaths = ["etc/ssh/ssh_host_ed25519_key"];
    };
  };
}
