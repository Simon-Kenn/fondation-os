{
  fonts = import ./fonts.nix;
  wallpaper = import ./wallpaper.nix;

  firefox  = import ./programs/browsers/firefox.nix;

  discord = import ./programs/communication/discord.nix;
  element = import ./programs/communication/element.nix;
  proton = import ./programs/communication/proton.nix;
  signal = import ./programs/communication/signal.nix;

  calibre = import ./programs/media/calibre.nix;
  mpv = import ./programs/media/mpv.nix;
  pavucontrol = import ./programs/media/pavucontrol.nix;
  sublime-music = import ./programs/media/sublime-music.nix;

  anki  = import  ./programs/office/anki.nix;
  libre-office = import ./programs/office/libreoffice.nix;


  playerctl = import ./services/media/playerctl.nix;

  alacritty = import ./cli/emulators/alacritty.nix;
  kitty = import ./cli/emulators/kitty.nix;

  fish = import ./cli/shells/fish.nix;

  zellij = import ./cli/multiplexers/zellij;

  bat = import ./cli/programs/bat.nix;
  direnv = import ./cli/programs/direnv.nix;
  duf = import ./cli/programs/duf.nix;
  dust = import ./cli/programs/dust.nix;
  eza = import ./cli/programs/eza.nix;
}
