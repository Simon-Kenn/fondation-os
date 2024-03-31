{
	inputs,
	pkgs,
	config,
	lib,
	...
}: 
with lib; let
	cfg = config.modules.cli.editors.nvim;
in {

	imports = [
		inputs.nixvim.homeManagerModules.nixvim
		#./vbepo.nix
		#./keymaps.nix
		#./options.nix
		#./ui.nix
		#./ux.nix
		#./completion.nix
		#./langage.nix
		#./neorg.nix
	];

	options.modules.cli.editors.nvim =  {
		enable = mkEnableOption "Enable nvim editor";
	};

	config = mkIf cfg.enable {

		programs.neovim = {
			viAlias = true;
			vimAlias = true;
			defaultEditor = true;
		};

		programs.nixvim = {
			enable = true;
			package = pkgs.neovim-nightly;
			defaultEditor = true;
			viAlias = true;
			vimAlias = true;
		};
	};
}
