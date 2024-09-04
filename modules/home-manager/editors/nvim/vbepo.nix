{
  programs.nixvim = {
    keymaps = [
			{ mode = "n"; key = "w"; action = ":ZenMode<CR>"; options = { desc = "ZenMode";}; }
# Mouvement
      { mode = ["n" "v" "o"]; key = "é"; action = "w" ; options = { desc = "words forward"; }; }
      { mode = ["n" "v" "o"]; key = "É"; action = "W" ; options = { desc = "WORDS forward"; }; }

      { mode = ["n" "v" "o"]; key = "t"; action = "h" ; options = { desc = "left"; }; }
      { mode = ["n" "v" "o"]; key = "s"; action = "j" ; options = { desc = "down"; }; }
      { mode = ["n" "v" "o"]; key = "r"; action = "k" ; options = { desc = "up"; }; }
      { mode = ["n" "v" "o"]; key = "n"; action = "l" ; options = { desc = "right"; }; }

      { mode = ["n" "v" "o"]; key = "T"; action = "H" ; options = { desc = "screen up"; }; }
      { mode = ["n" "v" "o"]; key = "N"; action = "L" ; options = { desc = "screen down"; }; }

      { mode = ["n" "v" "o"]; key = "S"; action = "J" ; options = { desc = "join"; }; }
      { mode = ["n" "v" "o"]; key = "R"; action = "K" ; options = { desc = "help"; }; }

      { mode = ["n" "v" "o"]; key = "k"; action = "t" ; options = { desc = "Till before [count] char"; }; }
      { mode = ["n" "v" "o"]; key = "K"; action = "T" ; options = { desc = "Till after [count] char"; }; }

      { mode = ["n" "v" "o"]; key = "j"; action = "s" ; options = { desc = "delete x char"; }; }
      { mode = ["n" "v" "o"]; key = "J"; action = "S" ; options = { desc = "delete x line"; }; }

      { mode = ["n" "v" "o"]; key = "h"; action = "r" ; options = { desc = "Substitute char"; }; }
      { mode = ["n" "v" "o"]; key = "H"; action = "R" ; options = { desc = "Substitute line"; }; }

      { mode = ["n" "v" "o"]; key = "l"; action = "n" ; options = { desc = "repeat search forward"; }; }
      { mode = ["n" "v" "o"]; key = "L"; action = "N" ; options = { desc = "repeat search backward"; }; }

      { mode = ["n" "v" "o"]; key = "gr"; action = "gk" ; options = { desc = "line screen backward"; }; }
      { mode = ["n" "v" "o"]; key = "gs"; action = "gj" ; options = { desc = "line screen forward"; }; }

      { mode = ["n" "v" "o"]; key = "è"; action = "^" ; options = { desc = "beg line"; }; }
      { mode = ["n" "v" "o"]; key = "È"; action = "0" ; options = { desc = "beg line"; }; }


      { mode = ["n" "v" "o"]; key = "gb"; action = "gT" ; options = { desc = "tap prev"; }; }
      { mode = ["n" "v" "o"]; key = "gé"; action = "gt" ; options = { desc = "tab next"; }; }

      { mode = ["n" "v" "o"]; key = "\""; action = "1"; }
      { mode = ["n" "v" "o"]; key = "1"; action = "\""; }
      { mode = ["n" "v" "o"]; key = "«"; action = "2"; }
      { mode = ["n" "v" "o"]; key = "2"; action = "«"; }
      { mode = ["n" "v" "o"]; key = "3"; action = "»"; }
      { mode = ["n" "v" "o"]; key = "»"; action = "3"; }
      { mode = ["n" "v" "o"]; key = "("; action = "4"; }
      { mode = ["n" "v" "o"]; key = "4"; action = "("; }
      { mode = ["n" "v" "o"]; key = ")"; action = "5"; }
      { mode = ["n" "v" "o"]; key = "5"; action = ")"; }
      { mode = ["n" "v" "o"]; key = "@"; action = "6"; }
      { mode = ["n" "v" "o"]; key = "6"; action = "@"; }
      { mode = ["n" "v" "o"]; key = "+"; action = "7"; }
      { mode = ["n" "v" "o"]; key = "7"; action = "+"; }
      { mode = ["n" "v" "o"]; key = "-"; action = "8"; }
      { mode = ["n" "v" "o"]; key = "8"; action = "-"; }
      { mode = ["n" "v" "o"]; key = "/"; action = "9"; }
      { mode = ["n" "v" "o"]; key = "9"; action = "/"; }
      { mode = ["n" "v" "o"]; key = "*"; action = "0"; }
      { mode = ["n" "v" "o"]; key = "0"; action = "*"; }


# Texte objects
      { mode = "o"; key = "aé"; action = "aw"; options = { desc = "a word"; }; }
      { mode = "o"; key = "aÉ"; action = "aW"; options = { desc = "inner word"; }; }
      { mode = "o"; key = "ié"; action = "iw"; options = { desc = "a WORD"; }; }
      { mode = "o"; key = "iÉ"; action = "iW"; options = { desc = "inner WORD"; }; }
    ];
  };
}
