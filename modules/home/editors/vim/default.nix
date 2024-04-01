{ lib, config, ...}:
with lib; let  
	cfg = config.modules.home.editors.vim;
in {
	options.modules.home.editors.vim = {
		enable = mkEnableOption "Enable vim";
	};

	config = mkIf cfg.enable {
		programs.vim = {
			enable = true;
			extraConfig = builtins.readFile ./vimrc;
		};
	};
}
