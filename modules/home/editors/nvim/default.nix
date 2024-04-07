{
	inputs,
	pkgs,
	config,
	lib,
	...
}: 
with lib; 
let
	cfg = config.modules.home.editors.nvim;
in 
{
			options.modules.home.editors.nvim =  {
				enable = mkEnableOption "Enable nvim editor";
			};

			imports = [
					inputs.nixvim.homeManagerModules.nixvim
					./vbepo.nix
					./keymaps.nix
					./options.nix
					./ui.nix
					./ux.nix
					#./completion.nix
					./langage.nix
					./neorg.nix
				];
			
				config = mkIf cfg.enable {
			
					programs.neovim = {
						viAlias = true;
						vimAlias = true;
						defaultEditor = true;
						enable = true;
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
