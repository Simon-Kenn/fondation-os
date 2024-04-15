{
	inputs,
	pkgs,
	config,
	lib,
	...
}: 
with lib; 
let
	cfg = config.hm.editors.nvim;
in 
{
	options.hm.editors.nvim =  {
		enable = mkEnableOption "Enable nvim editor";
	};

	imports = [
		inputs.nixvim.homeManagerModules.nixvim
		./vbepo.nix
		./keymaps.nix
		./options.nix
		./ui.nix
		./ux.nix
		./neorg.nix
		#./completion.nix
		./langage.nix
	];
	
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
