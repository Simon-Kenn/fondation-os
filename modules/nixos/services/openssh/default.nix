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
    PermitRootLogin = mkOption {
      default = "no";
      type = types.str;
      description = "Permit root login";
    };
    PasswordAuthentication = mkOption {
      type = types.bool;
      default = false;
      description = "Enable PasswordAuthentication";
    };
  };

  config = mkIf cfg.enable {
    services.openssh = {
      enable = true;
      settings = {
        PasswordAuthentication = cfg.PasswordAuthentication;
        PermitRootLogin = cfg.PermitRootLogin;
      };
    };

    users = {
      users = {
        ${config.fdn.user.name}.openssh.authorizedKeys.keys = [
          #"ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGvp/TdTeIuLKSk1/NWi+U0tP2pF1pdbQxD5UwaEtT4Z leto@farstar"
          "sk-ssh-ed25519@openssh.com AAAAGnNrLXNzaC1lZDI1NTE5QG9wZW5zc2guY29tAAAAIDp7PqGr6llGvhISKN08+4UWt6IKQgMVrO7ynCWdXqNkAAAABHNzaDo= leto@farstar"
          "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHlkGcpz4YPfrxG/Yc/wgX29gk20X/VFoXUcm8vwR/7E root@farstar"
        ];
      };
      extraUsers.root = {
        openssh.authorizedKeys.keys = [
          "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGvp/TdTeIuLKSk1/NWi+U0tP2pF1pdbQxD5UwaEtT4Z leto@farstar"
          "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHlkGcpz4YPfrxG/Yc/wgX29gk20X/VFoXUcm8vwR/7E root@farstar"
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
