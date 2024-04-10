{ lib, config, ...}:
with lib; let 
	cfg = config.os.network.openssh;
	hasOptinPersistence = config.environment.persistence ? "/persist";
in {

	options.os.network.openssh = {
		enable = mkEnableOption "Enable systemd boot";
	};

	config = mkIf cfg.enable {
		services.openssh = {
			enable = true;
			settings = {
				PasswordAuthentication = false;
				PermitRootLogin = "no";
			};

			hostKeys = [
				{
					path = "${lib.optionalString hasOptinPersistence "/persist"}/etc/ssh/ssh_host_ed25519_key";
					type = "ed25519";
				}
			];
		};
	};
}
