{
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.fdn.services.openssh;
in {
  options.fdn.services.openssh = {
    enable = mkEnableOption "Enable openssh";
  };

  config = mkIf cfg.enable {
    services.openssh = {
      enable = true;
      settings = {
        PasswordAuthentication = false;
      };
    };

    users.users = {
      ${config.fdn.user.name}.openssh.authorizedKeys.keys = [
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGvp/TdTeIuLKSk1/NWi+U0tP2pF1pdbQxD5UwaEtT4Z leto@farstar"
      ];
    };

    environment.persistence."/persist".files = [
      "/etc/ssh/ssh_host_ed25519_key"
      "/etc/ssh/ssh_host_ed25519_key.pub"
      "/etc/ssh/ssh_host_rsa_key"
      "/etc/ssh/ssh_host_rsa_key.pub"
    ];
  };
}
