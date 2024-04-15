{ config, lib, pkgs, ...}:
with lib; let 
	cfg = config.os.hardware.bluetooth;
in {

	options.os.hardware.bluetooth = {
		enable = mkEnableOption "Enable bluetooth";
	};

	config = mkIf cfg.enable {
		services.blueman.enable = true;
		hardware = {
			bluetooth = {
				enable = true;
				powerOnBoot = false;
				settings = {
					General = {
						Experimental = true;
					};
				};
			};
		};
	};
}
