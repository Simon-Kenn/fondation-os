{ pkgs, config, lib, ...}:
with lib; let 
	cfg = config.os.system.systemd-boot;
in {
	options.os.system.systemd-boot = {
		enable = mkEnableOption "Enable systemd boot";
	};

	config = mkIf cfg.enable {
		boot = {

			kernelPackages = pkgs.linuxPackages_latest;

			loader = {
				systemd-boot = {
					enable = true;
					configurationLimit = 20;
				};
			};

			plymouth = {
				enable = true;
				theme = "catppuccin-mocha";
				themePackages = [(pkgs.catppuccin-plymouth.override { variant = "mocha";})];
			};
		};
	};
}
