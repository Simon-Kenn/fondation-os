{pkgs, ...}: {
  imports = [
    ./shells/fish.nix
    ./multiplexers/zellij
    ./programs
  ];

  home.packages = with pkgs; [
    feh
    fd
  ];
}
