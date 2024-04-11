{
	inputs, 
	lib,
	config,
	...
}: 
with lib; let 
	cfg = config.desktops.ui.colors;
in {
	
	imports = [
		inputs.nix-colors.homeManagerModule
	];

	options.desktops.ui.colors = {
		enable = mkEnableOption "Enable nix colors";
	};

	config = mkIf cfg.enable {
		colorscheme = inputs.nix-colors.colorSchemes.catppuccin-mocha;
	};
}
