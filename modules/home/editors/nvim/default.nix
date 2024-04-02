{ inputs, ...}:
with inputs; 
{
	imports = [
		nixvim.homeManagerModules.nixvim
	];
}
#{
#	inputs,
#	pkgs,
#	config,
#	lib,
#	...
#}: 
#with lib; 
#let
#	cfg = config.modules.home.editors.nvim;
#in 
#{
#			imports = [
#					inputs.nixvim.homeManagerModules.nixvim
#					./vbepo.nix
#					./keymaps.nix
#					./options.nix
#					./ui.nix
#					./ux.nix
#					./completion.nix
#					./langage.nix
#					./neorg.nix
#				];
#			
#				#options.modules.home.editors.nvim =  {
#				#	enable = mkEnableOption "Enable nvim editor";
#				#};
#			
#				#config = mkIf cfg.enable {
#			
#				#	programs.neovim = {
#				#		viAlias = true;
#				#		vimAlias = true;
#				#		defaultEditor = true;
#				#		enable = true;
#				#	};
#			
#				#	programs.nixvim = {
#				#		enable = true;
#				#		package = pkgs.neovim-nightly;
#				#		defaultEditor = true;
#				#		viAlias = true;
#				#		vimAlias = true;
#				#	};
#				#};
#}
