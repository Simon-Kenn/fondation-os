{ lib, config, ...}:
with lib; let  
	cfg = config.hm.editors.vim;
in {

	options.hm.editors.vim = {
		enable = mkEnableOption "Enable vim";
	};

	config = mkIf cfg.enable {
		programs.vim = {
			enable = true;
			extraConfig = builtins.readFile ./vimrc;
		};
	};
}
