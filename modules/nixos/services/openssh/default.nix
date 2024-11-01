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
        PermitRootLogin = "prohibit-password";
        PubkeyAuthentication = "yes";
        PubkeyAuthOptions = "verify-required";
      };
    };

    users = {
      users = {
        leto.openssh.authorizedKeys.keyFiles = [
          ../../../../home/leto/ssh.pub
        ];

        root.openssh.authorizedKeys.keyFiles = [
          ../../../../home/leto/ssh.pub
        ];
      };
    };

    environment = mkIf config.fdn.system.impermanence.enable {
      persistence."/persist".files = [
        "/etc/ssh/ssh_host_ed25519_key"
        "/etc/ssh/ssh_host_ed25519_key.pub"
        "/etc/ssh/ssh_host_rsa_key"
        "/etc/ssh/ssh_host_rsa_key.pub"
      ];
    };
  };
}
