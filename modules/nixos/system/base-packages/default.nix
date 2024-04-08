{ lib, pkgs, config, ...}:
with lib; let 
	cfg = config.os.system.base-packages;
in {

	options.os.system.base-packages = {
		enable = mkEnableOption "Enable minimal packages pack";
	};

	config = mkIf cfg.enable {
		environment.systemPackages = with pkgs; [
			git
			pciutils
			wget
			curl
			sops
			age
			gnupg
			ssh-to-age
		];
	};
}
