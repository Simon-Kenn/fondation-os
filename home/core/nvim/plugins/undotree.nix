{
  programs.nixvim = {
    keymaps = [
      {
        mode = "n";
        key = "<leader>u";
        action = "vim.cmd.UndotreeToggle";
        options.desc = "Undotree";
      }
    ];
    plugins.undotree = {
      enable = true;

      settings = {
        WindowLayout = 4;
        ShortIndicators = false;
        DiffpanelHeight = 10;
        DiffAutoOpen = true;
        SetFocusWhenToggle = true;
        SplitWidth = 40;
        TreeNodeShape = "*";
        TreeVertShape = "|";
        TreeSplitShape = "/";
        TreeReturnShape = "\\";
        DiffCommand = "diff";
        RelativeTimestamp = true;
        HighlightChangedText = true;
        HighlightChangedWithSign = true;
        HighlightSyntaxAdd = "DiffAdd";
        HighlightSyntaxChange = "DiffChange";
        HighlightSyntaxDel = "DiffDelete";
        HelpLine = true;
        CursorLine = true;
      };
    };
  };
}
