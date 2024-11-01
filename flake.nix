{
  description = "A declarative, autonomous, and functional information system";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-23.05";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    deploy-rs.url = "github:serokell/deploy-rs";

    impermanence.url = "github:nix-community/impermanence";

    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixos-anywhere = {
      url = "github:numtide/nixos-anywhere";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.disko.follows = "disko";
    };

    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-colors.url = "github:misterio77/nix-colors";
    catppuccin.url = "github:catppuccin/nix";

    # neovim.url = "github:nix-community/neovim-nightly-overlay";
    neovim.url = "github:Simon-Kenn/quantum";

    ags.url = "github:Aylur/ags";

    # hyprwm
    hyprland.url = "git+https://github.com/hyprwm/Hyprland";

    hyprland-contrib = {
      url = "github:hyprwm/contrib";
      inputs.nixpkgs.follows = "hyprland/nixpkgs";
    };

    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.hyprland.follows = "hyprland";
    };

    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    firefox-gnome-theme = {
      url = "github:rafaelmardojai/firefox-gnome-theme";
      flake = false;
    };
  };

  outputs = {
    self,
    nixpkgs,
    nixpkgs-stable,
    home-manager,
    deploy-rs,
    ...
    } @ inputs: let
      inherit (self) outputs;
      lib = nixpkgs.lib // home-manager.lib;
      systems = "x86_64-linux";
      forEachSystem = f: lib.genAttrs systems (system: f pkgsFor.${system});
      pkgsFor = lib.genAttrs systems (
        system:
        import nixpkgs {
          inherit system;
          config.allowUnfree = true;
        }
      );
    in {
      inherit lib;
      nixosModules = import ./modules/nixos;
      homeManagerModules = import ./modules/home-manager;

      overlays = import ./overlays {inherit inputs outputs;};

      pakages = forEachSystem (pkgs: import ./shell.nix {inherit pkgs;});
      devShells = forEachSystem (pkgs: import ./shell.nix {inherit pkgs;});
      formatter = forEachSystem (pkgs: pkgs.alejandra);

      nixosConfigurations = {
        iso = lib.nixosSystem {
          modules = [
            "${nixpkgs}/nixos/modules/installer/cd-dvd/installation-cd-minimal.nix"
            ./systems/x86_64-linux-iso/minimal
          ];
          specialArgs = {inherit inputs outputs;};
        };

        air-gapped-iso = lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            "${nixpkgs}/nixos/modules/profiles/all-hardware.nix"
            "${nixpkgs}/nixos/modules/installer/cd-dvd/iso-image.nix"
            ./systems/x86_64-linux-iso/air-gapped
          ];
          specialArgs = {inherit inputs outputs; };
        };

        farstar = lib.nixosSystem {
          system = "x86_64-linux";
          modules = [./systems/x86_64-linux/farstar];
          specialArgs = {inherit inputs outputs;};
        };

        babel = lib.nixosSystem {
          system = "x86_64-linux";
          modules = [./systems/x86_64-linux/babel];
          specialArgs = {inherit inputs outputs;};
        };
      };

      homeConfigurations = {
        "nixos@iso" = lib.homeManagerConfiguration {
          modules = [./homes/nixos-iso/home.nix];
          pkgs = pkgsFor.x86_64-linux;
          extraSpecialArgs = {inherit inputs outputs;};
        };

        "leto@farstar" = lib.homeManagerConfiguration {
          modules = [./home/leto/farstar.nix];
          pkgs = pkgsFor.x86_64-linux;
          extraSpecialArgs = {inherit inputs outputs;};
        };
        "leto@babel" = lib.homeManagerConfiguration {
          modules = [./home/leto/babel.nix];
          pkgs = pkgsFor.x86_64-linux;
          extraSpecialArgs = {inherit inputs outputs;};
        };
      };

      deploy.nodes = {
        babel = {
          hostname = "babel";
          profiles.system = {
            user = "leto";
            path = deploy-rs.lib.x86_64-linux.activate.nixos self.nixosConfigurations.babel;
          };
        };
      };

      checks = builtins.mapAttrs (system: deployLib: deployLib.deployChecks self.deploy) deploy-rs.lib;
    };
}
