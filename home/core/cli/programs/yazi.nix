{pkgs, ...}: {
  programs.yazi = {
    enable = true;
    enableFishIntegration = true;
    catppuccin.enable = true;

    keymap = {
      manager.prepend_keymap = [
        {
          on = ["r"];
          run = "arrow -1";
          desc = "Move cursor up";
        }
        {
          on = ["s"];
          run = "arrow 1";
          desc = "Move cursor down";
        }
        {
          on = ["R"];
          run = "arrow -5";
          desc = "Move cursor up 5 line";
        }
        {
          on = ["S"];
          run = "arrow 5";
          desc = "Move cursor down 5 line";
        }
        {
          on = ["t"];
          run = "leave";
          desc = "Go back to the parent directory";
        }
        {
          on = ["n"];
          run = "enter";
          desc = "Enter the child directory";
        }

        {
          on = ["T"];
          run = "back";
          desc = "Go back to the previous directory";
        }

        {
          on = ["N"];
          run = "forward";
          desc = "Go forward to the next director";
        }

        {
          on = ["h"];
          run = "rename --cursor=before_ext";
          desc = "Rename a file or directory";
        }

        {
          on = ["l"];
          run = "search fd";
          desc = "Search files by name using fd";
        }

        {
          on = ["L"];
          run = "search rg";
          desc = "Search files by content using ripgrep";
        }

        {
          on = ["j"];
          run = "tab_create --curent";
          desc = "Create a new tab using the current path";
        }
      ];
      tasks.prepend_keymap = [
        {
          on = ["r"];
          run = "arrow -1";
          desc = "Move cursor up";
        }
        {
          on = ["s"];
          run = "arrow 1";
          desc = "Move cursor up";
        }
      ];
      select.prepend_keymap = [
        {
          on = ["r"];
          run = "arrow -1";
          desc = "Move cursor up";
        }
        {
          on = ["s"];
          run = "arrow 1";
          desc = "Move cursor down";
        }
        {
          on = ["R"];
          run = "arrow -5";
          desc = "Move cursor up 5 line";
        }
        {
          on = ["S"];
          run = "arrow 5";
          desc = "Move cursor down 5 line";
        }
      ];
      input.prepend_keymap = [
        # Character-wise movement
        {
          on = ["t"];
          run = "move -1";
          desc = "Move back a character";
        }
        {
          on = ["n"];
          run = "move 1";
          desc = "Move forward a character";
        }
        # Word-wise movement
        {
          on = ["é"];
          run = "forward";
          desc = "Move forward to the start of the next word";
        }
        # Line-wise movement
        {
          on = ["è"];
          run = "move -999";
          desc = "Move to the BOL";
        }
      ];
    };
  };

  home.packages = with pkgs; [
    imagemagick
    ffmpegthumbnailer
    fontpreview
    unar
    poppler
    unar
  ];
}
