{
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

  hyprland = import ./programs/wayland/hyprland;
  hyprlock = import ./programs/wayland/hyprlock.nix;
  waybar = import ./programs/wayland/waybar.nix;
  wofi = import  ./programs/wayland/wofi.nix;

  playerctl = import ./services/media/playerctl.nix;

  hyprpaper = import ./services/wayland/hyprpaper.nix;
  hypridle = import ./services/wayland/hypridle.nix;
  mako = import  ./services/wayland/mako.nix;
  gammastep = import ./services/wayland/gammastep.nix;

  alacritty = import ./cli/emulators/alacritty.nix;
  kitty = import ./cli/emulators/kitty.nix;

  fish = import ./cli/shells/fish;

  zellij = import ./cli/multiplexers/zellij;

  bat = import ./cli/programs/bat.nix;
  direnv = import ./cli/programs/direnv.nix;
  duf = import ./cli/programs/duf.nix;
  dust = import ./cli/programs/dust.nix;
  eza = import ./cli/programs/eza.nix;
  fd = import ./cli/programs/fd.nix;
  fzf = import ./cli/programs/fzf.nix;
  git = import ./cli/programs/git.nix;
  gpg = import ./cli/programs/gpg.nix;
  neomutt = import ./cli/programs/neomutt.nix;
  packages = import ./cli/programs/packages.nix;
  ripgrep = import ./cli/programs/ripgrep.nix;
  ssh = import ./cli/programs/ssh.nix;
  starship = import ./cli/programs/starship.nix;
  yazi = import ./cli/programs/yazi.nix;
  zoxide = import ./cli/programs/zoxide.nix;

  #nvim = import ./editors/nvim;

  gtk =  import ./system/gtk.nix;
  home-manager = import ./system/home-manager.nix;
  impermanence = import ./system/impermanence.nix;
  nix = import ./system/nix.nix;
  qt = import ./system/qt.nix;
  xdg = import ./system/xdg.nix;
  

  catppuccin = import ./themes/catppuccin.nix;
  font = import ./themes/fonts.nix;
  wallpaper = import ./themes/wallpaper.nix;
}
