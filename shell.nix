{
  inputs,
  pkgs ? let
    lock = (builtins.fromJSON (builtins.readFile ./flake.lock)).nodes.nixpkgs.locked;
    nixpkgs = fetchTarball {
      url = "https://github.com/nixos/nixpkgs/archive/${lock.rev}.tar.gz";
      sha256 = lock.narHash;
    };
  in
    import nixpkgs {overlays = [];},
  ...
}: {
  default = pkgs.mkShell {
    NIX_CONFIG = "extra-experimental-features = nix-command flakes";
    nativeBuildInputs = with pkgs; [
      inputs.nixos-anywhere.packages.${pkgs.system}.nixos-anywhere
      deploy-rs

      nix
      home-manager
      statix
      deadnix
      alejandra

      git
      sops
      ssh-to-age
      gnupg
      age
    ];
  };
}
