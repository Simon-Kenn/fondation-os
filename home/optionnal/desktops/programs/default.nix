{pkgs, ...}: {
  imports = [
    ./anki.nix
    ./discord.nix
    ./firefox.nix
    ./pavucontrols.nix
    ./playerctl.nix
    ./element-desktop.nix
    ./calibre.nix
    ./libreoffice.nix
    ./signal-dekstop.nix
    #./sublime-music.nix
  ];
}
