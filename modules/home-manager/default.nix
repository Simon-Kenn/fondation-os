{
  fonts = import ./fonts.nix;
  wallpaper = import ./wallpaper.nix;

  anki  = import  ./programs/anki.nix;
  calibre = import ./programs/calibre.nix;
  discord = import ./programs/discord.nix;
  element = import ./programs/element.nix;
}
