{ lib, config, outputs, ...}:
with lib; let 
	inherit (config.networking) hostName;
	cfg = config.os.network.openssh;
	host = outputs.nixosConfigurations;
	pubKey = host: ../../${host}/ssh_host_ed25519_key.pub;
	hasOptinPersistence = config.environment.persistence ? "/persist";
in {

	options.os.network.openssh = {
		enable = mkEnableOption "Enable systemd boot";
	};

	config = mkIf cfg.enable {
		#services.openssh = {
		#	enable = true;
		#	settings = {
		#		PasswordAuthentication = false;
		#		PermitRootLogin = "no";
		#	};

		#	hostKeys = [
		#		{
		#			path = "${lib.optionalString hasOptinPersistence "/persist"}/etc/ssh/ssh_host_ed25519_key";
		#			type = "ed25519";
		#		}
		#	];
		#};

		#programs.ssh = {
		#	knownHosts.hostName = {
		#		publicKeyFile = pubKey;
		#	};
		#};
	};
}
