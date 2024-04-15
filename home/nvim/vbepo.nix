{
  programs.nixvim = {
    keymaps = [
    # TODO: utiliser w/W
# Mouvement
      { mode = "n"; key = "é"; action = "w" ; options = { desc = "words forward"; }; }
      { mode = "n"; key = "É"; action = "W" ; options = { desc = "WORDS forward"; }; }

      { mode = "n"; key = "t"; action = "h" ; options = { desc = "left"; }; }
      { mode = "n"; key = "s"; action = "j" ; options = { desc = "down"; }; }
      { mode = "n"; key = "r"; action = "k" ; options = { desc = "up"; }; }
      { mode = "n"; key = "n"; action = "l" ; options = { desc = "right"; }; }

      { mode = "n"; key = "T"; action = "H" ; options = { desc = "screen up"; }; }
      { mode = "n"; key = "N"; action = "L" ; options = { desc = "screen down"; }; }

      { mode = "n"; key = "S"; action = "J" ; options = { desc = "join"; }; }
      { mode = "n"; key = "R"; action = "K" ; options = { desc = "help"; }; }

      { mode = "n"; key = "k"; action = "t" ; options = { desc = "Till before [count] char"; }; }
      { mode = "n"; key = "K"; action = "T" ; options = { desc = "Till after [count] char"; }; }

      { mode = "n"; key = "j"; action = "s" ; options = { desc = "delete x char"; }; }
      { mode = "n"; key = "J"; action = "S" ; options = { desc = "delete x line"; }; }

      { mode = "n"; key = "h"; action = "r" ; options = { desc = "Substitute char"; }; }
      { mode = "n"; key = "H"; action = "R" ; options = { desc = "Substitute line"; }; }

      { mode = "n"; key = "l"; action = "n" ; options = { desc = "repeat search forward"; }; }
      { mode = "n"; key = "L"; action = "N" ; options = { desc = "repeat search backward"; }; }

      { mode = "n"; key = "gr"; action = "gk" ; options = { desc = "line screen backward"; }; }
      { mode = "n"; key = "gs"; action = "gj" ; options = { desc = "line screen forward"; }; }

      { mode = "n"; key = "è"; action = "^" ; options = { desc = "beg line"; }; }
      { mode = "n"; key = "È"; action = "0" ; options = { desc = "beg line"; }; }


      { mode = "n"; key = "gb"; action = "gT" ; options = { desc = "tap prev"; }; }
      { mode = "n"; key = "gé"; action = "gt" ; options = { desc = "tab next"; }; }

      { mode = "n"; key = "\""; action = "1"; }
      { mode = "n"; key = "1"; action = "\""; }
      { mode = "n"; key = "«"; action = "2"; }
      { mode = "n"; key = "2"; action = "«"; }
      { mode = "n"; key = "3"; action = "»"; }
      { mode = "n"; key = "»"; action = "3"; }
      { mode = "n"; key = "("; action = "4"; }
      { mode = "n"; key = "4"; action = "("; }
      { mode = "n"; key = ")"; action = "5"; }
      { mode = "n"; key = "5"; action = ")"; }
      { mode = "n"; key = "@"; action = "6"; }
      { mode = "n"; key = "6"; action = "@"; }
      { mode = "n"; key = "+"; action = "7"; }
      { mode = "n"; key = "7"; action = "+"; }
      { mode = "n"; key = "-"; action = "8"; }
      { mode = "n"; key = "8"; action = "-"; }
      { mode = "n"; key = "/"; action = "9"; }
      { mode = "n"; key = "9"; action = "/"; }
      { mode = "n"; key = "*"; action = "0"; }
      { mode = "n"; key = "0"; action = "*"; }


# Texte objects
      { mode = "o"; key = "aé"; action = "aw"; options = { desc = "a word"; }; }
      { mode = "o"; key = "aÉ"; action = "aW"; options = { desc = "inner word"; }; }
      { mode = "o"; key = "ié"; action = "iw"; options = { desc = "a WORD"; }; }
      { mode = "o"; key = "iÉ"; action = "iW"; options = { desc = "inner WORD"; }; }
    ];
  };
}
