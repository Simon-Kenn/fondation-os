{
  fonts = import ./fonts.nix;
  wallpaper = import ./wallpaper.nix;

  anki  = import  ./programs/anki.nix;
  calibre = import ./programs/calibre.nix;
  discord = import ./programs/discord.nix;
  element = import ./programs/element.nix;
  firefox  = import ./programs/firefox.nix;
  libre-office = import ./programs/libreoffice.nix;
  mpv = import ./programs/mpv.nix;
  pavucontrol = import ./programs/pavucontrol.nix;

  services = import ./services/playerctl.nix;
}
