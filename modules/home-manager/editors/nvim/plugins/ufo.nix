{
  programs.nixvim = {
    keymaps = [
      {
        mode = "n";
        key = "zR";
        action = "require('ufo').openAllFolds";
        options.desc = "open all fold";
      }
      {
        mode = "n";
        key = "zM";
        action = "ufo.closeAllFolds";
        options.desc = "close all fols";
      }
    ];
    plugins.nvim-ufo = {
      enable = true;
      providerSelector =
        /*
        lua
        */
        ''
          function(bufnr, filetype, buftype)
            return {'treesitter', 'indent'}
          end
        '';
    };
  };
}
