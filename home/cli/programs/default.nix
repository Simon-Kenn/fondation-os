{pkgs, ...}: {
  imports = [
    #./starfish.nix
    ./bat.nix
    ./direnv.nix
    ./eza.nix
    ./fzf.nix
    ./git.nix
    ./gpg.nix
    ./ripgrep.nix
    ./yazi.nix
    ./zoxide.nix
  ];
}
