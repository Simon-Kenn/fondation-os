{ config, lib, ...}:
with lib; let 
	cfg = config.os.network.network-manager;
in {

	options.os.network.network-manager = {
		enable = mkEnableOption "Enable network-manager";
	};

	config = mkIf cfg.enable {
		networking = {
			useDHCP = lib.mkForce true;
			networkmanager.enable = true;
		};
	};
}
