{
  lib,
  pkgs,
  inputs,
  outputs,
  ...
}: {
  imports =
    [
      inputs.impermanence.nixosModules.home-manager.impermanence
      inputs.nix-colors.homeManagerModule
      ../cli
      ../nvim
    ]
    ++ (builtins.attrValues outputs.homeManagerModules);

  nixpkgs = {
    overlays = builtins.attrValues outputs.overlays;
    config = {
      allowUnfree = true;
      allowUnfreePredicate = _:true;
    };
  };

  nix = {
    package = lib.mkDefault pkgs.nix;
    settings = {
      experimental-features = [
        "nix-command"
        "flakes"
        "repl-flake"
      ];
      warn-dirty = false;
    };
  };

  systemd.user.startServices = "sd-switch";
  programs.home-manager.enable = true;

  home = {
    username = lib.mkDefault "leto";
    homeDirectory = lib.mkDefault "/home/leto";
    stateVersion = lib.mkDefault "24.05";

    persistence = {
      "/persist/home/leto" = {
        directories = [
          "Bibliothèque"
          "Notes"
          "Codes"
          ".local/bin"
          ".local/share/nix"
        ];
        allowOther = true;
      };
    };
  };

  colorScheme = inputs.nix-colors.colorSchemes.catppuccin-mocha;
}
