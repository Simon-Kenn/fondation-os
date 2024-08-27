{ config, ...}: let 
  pkgs = import (builtins.fetchTarball {
    url = "https://github.com/NixOS/nixpkgs/archive/05bbf675397d5366259409139039af8077d695ce.tar.gz";
    sha256 = "sha256:1r26vjqmzgphfnby5lkfihz6i3y70hq84bpkwd43qjjvgxkcyki0";
  }) { config = config.nixpkgs.config; system = "x86_64-linux"; };

  myPkg = pkgs.hyprland;
in {
  imports = [
    ../programs
    ../wayland
    ../ui
    ../gaming
    ../terminals/kitty.nix

    ./config.nix
    ./workspaces.nix
    ./keymaps-global.nix
    ./keymaps-app.nix
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    #package = myPkg;
  };
}
