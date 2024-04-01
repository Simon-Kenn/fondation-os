{ lib, config, outputs, ...}: 
with lib; let 
	cfg = config.modules.home.system.nixpkgs;
in {

	options.modules.home.system.nixpkgs = {
		enable = mkEnableOption "Wether or not to manage nixkpgs";
	};

	config = mkIf cfg.enable {
		nixpkgs = {
			config = {
				allowUnfree = true;
			};
			overlays = builtins.attrValues outputs.overlays;
		};
	};
}
