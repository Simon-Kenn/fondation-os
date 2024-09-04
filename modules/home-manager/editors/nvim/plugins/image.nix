{
  programs.nixvim.plugins = {
    image = {
      enable = false;

      backend = "kitty";
      integrations = {
        markdown = {
          enabled = true;
          clearInInsertMode = false;
          downloadRemoteImages = true;
          onlyRenderImageAtCursor = false;
          filetypes = ["markdown" "vimwiki"];
        };
        neorg = {
          enabled = true;
          clearInInsertMode = false;
          downloadRemoteImages = true;
          onlyRenderImageAtCursor = false;
          filetypes = ["norg"];
        };
        syslang = {
          enabled = true;
          clearInInsertMode = false;
          downloadRemoteImages = true;
          onlyRenderImageAtCursor = false;
          filetypes = ["syslang"];
        };
      };
      maxWidth = null;
      maxHeight = null;
      maxWidthWindowPercentage = null;
      maxHeightWindowPercentage = 50;
      windowOverlapClearEnabled = false;
      windowOverlapClearFtIgnore = ["cmp_menu" "cmp_docs" ""];
      editorOnlyRenderWhenFocused = false;
      tmuxShowOnlyInActiveWindow = false;
      hijackFilePatterns = ["*.png" "*.jpg" "*.jpeg" "*.gif" "*.webp"];
    };
  };
}
