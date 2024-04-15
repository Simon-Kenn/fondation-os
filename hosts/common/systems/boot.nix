{ pkgs, ...}: {
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
}
