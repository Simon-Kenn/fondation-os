{
	programs.nixvim.plugins = {

		telescope = {
      enable = true;
      extensions.fzf-native.enable = true;
      extensions.undo.enable = true;
    };

		which-key.enable = true;
		undotree.enable = true;
		comment.enable = true;
		nvim-autopairs.enable = true;
		auto-save.enable = true;
	};
}
