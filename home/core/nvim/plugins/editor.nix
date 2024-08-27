{
  programs.nixvim = {
    plugins = {
      which-key = {
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
