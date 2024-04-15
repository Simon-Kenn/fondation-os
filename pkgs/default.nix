{pkgs ? import <nixpkgs> {}}: rec {
  wallpapers = pkgs.callPackage ./wallpapers {};
}
