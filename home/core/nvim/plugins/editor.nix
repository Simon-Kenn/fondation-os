{
  programs.nixvim = {
    plugins = {
      which-key = {
        enable = true;
      };
      nvim-autopairs = {
        enable = true;
      };
    };
    keymaps = [
      {
        mode = "n";
        action = ":WhichKey<cr>";
        key = "W";
        options.desc = "Show whichKey";
      }
    ];
  };
}
