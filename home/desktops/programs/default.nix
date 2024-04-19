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
    #./sublime-music.nix
  ];
}
