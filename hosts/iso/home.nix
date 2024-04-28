{
  lib,
  config,
  ...
}: {
  imports = [
    ../../home/core/nix.nix
  ];

  home = {
    username = lib.mkDefault "nixos";
    homeDirectory = lib.mkDefault "/home/${config.home.username}";
    stateVersion = lib.mkDefault "24.05";
  };

  programs.home-manager.enable = true;
  programs.git.enable = true;
}
