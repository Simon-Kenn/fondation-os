{
  programs.nixvim = {
    globals.mapleader = " ";
    globals.maplocalleader = ",";
    keymaps = [
      {
        mode = ["n" "t"];
        key = "<leader>cv";
        action = ":vsplit<CR>";
        options = {desc = "vertical split";};
      }
      {
        mode = ["n" "t"];
        key = "<leader>ch";
        action = ":split<CR>";
        options = {desc = "horizontal split";};
      }

      {
        mode = ["n" "t"];
        key = "<leader>t";
        action = "<C-w>h";
        options = {desc = "split left";};
      }
      {
        mode = ["n" "t"];
        key = "<leader>s";
        action = "<C-w>j";
        options = {desc = "split down";};
      }
      {
        mode = ["n" "t"];
        key = "<leader>r";
        action = "<C-w>k";
        options = {desc = "split up";};
      }
      {
        mode = ["n" "t"];
        key = "<leader>n";
        action = "<C-w>l";
        options = {desc = "split right";};
      }

      {
        mode = ["n" "t"];
        key = "<leader>T";
        action = "<C-w>H";
        options = {desc = "split to far left";};
      }
      {
        mode = ["n" "t"];
        key = "<leader>S";
        action = "<C-w>J";
        options = {desc = "split to far down";};
      }
      {
        mode = ["n" "t"];
        key = "<leader>R";
        action = "<C-w>K";
        options = {desc = "split to far up";};
      }
      {
        mode = ["n" "t"];
        key = "<leader>N";
        action = "<C-w>L";
        options = {desc = "split to far right";};
      }

      {
        mode = ["n" "t"];
        key = "<leader>cl";
        action = "<C-w>R";
        options = {desc = "split rotate down/right";};
      }
      {
        mode = ["n" "t"];
        key = "<leader>cL";
        action = "<C-w>r";
        options = {desc = "split rotate up/left";};
      }
      {
        mode = ["n" "t"];
        key = "<leader>cj";
        action = "<C-w>x";
        options = {desc = "split rotate down/right";};
      }
      {
        mode = ["n" "t"];
        key = "<leader>cJ";
        action = "<C-w>X";
        options = {desc = "split rotate up/left";};
      }

      {
        mode = ["n" "t"];
        key = "<leader><Up>";
        action = ":resize -2<CR>";
        options = {desc = "increment size";};
      }
      {
        mode = ["n" "t"];
        key = "<leader><Up>";
        action = ":resize -2<CR>";
        options = {desc = "increment size";};
      }
      {
        mode = ["n" "t"];
        key = "<leader><Down>";
        action = ":resize +2<CR>";
        options = {desc = "increment size";};
      }
      {
        mode = ["n" "t"];
        key = "<leader><Left>";
        action = ":vertical resize -2<CR>";
        options = {desc = "increment size";};
      }
      {
        mode = ["n" "t"];
        key = "<leader><Right>";
        action = ":vertical resize +2<CR>";
        options = {desc = "increment size";};
      }

      {
        mode = ["n" "t"];
        key = "<leader>cc";
        action = "<C-w>c";
        options = {desc = "split kill current";};
      }
      {
        mode = ["n" "t"];
        key = "<leader>co";
        action = "<C-w>o";
        options = {desc = "split kill all other";};
      }
    ];
  };
}
