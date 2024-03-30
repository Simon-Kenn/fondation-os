{ lib, config, ...}:
with lib; let  
	cfg = config.cli.editors.vim;
in {
	options.cli.editors.vim = {
		enable = mkEnableOption "Enable vim";
	};

	config = mkIf cfg.enable {
		programs.vim = {
			enable = true;
			extraConfig = builtins.readFile ./vimrc;
		};
	};
}
