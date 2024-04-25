{
  lib,
  outputs,
  ...
}: {
  imports =
    [
      ./nix.nix
      ./impermanence.nix
      ./cli
      ./nvim
    ]
    ++ (builtins.attrValues outputs.homeManagerModules);

  systemd.user.startServices = "sd-switch";
  programs.home-manager.enable = true;

  home = {
    username = lib.mkDefault "leto";
    homeDirectory = lib.mkDefault "/home/leto";
    stateVersion = lib.mkDefault "24.05";
  };
}
