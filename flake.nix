{ 
  description = "A declarative, autonomous, and functional information system";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

		snowfall-lib = {
			url = "github:snowfallorg/lib";
			inputs.nixpkgs.follows = "nixpkgs";
		};

		impermanence.url = "github:nix-community/impermanence";
		nix-colors.url = "github:misterio77/nix-colors";

		disko = {
			url = "github:nix-community/disko";
			inputs.nixpkgs.follows = "nixpkgs";
		};

		home-manager = {
			url = "github:nix-community/home-manager";
			inputs.nixpkgs.follows = "nixpkgs";
		};

		nixvim = {
			url = "github:nix-community/nixvim";
			inputs.nixpkgs.follows = "nixpkgs";
		};

		neorg-overlay.url = "github:nvim-neorg/nixpkgs-neorg-overlay";
		neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";

		hyprwm-contrib = {
			url = "github:hyprwm/contrib";
			inputs.nixpkgs.follows = "nixpkgs";
		};

    hyprpaper = {
      url = "github:hyprwm/hyprpaper";
      inputs.nixpkgs.follows = "nixpkgs";
    };

		firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
		};

		sops-nix = {
			url = "github:Mic92/sops-nix";
			inputs.nixpkgs.follows = "nixpkgs";
		};

    neorg-templates = {
      url = "github:pysan3/neorg-templates";
      flake = false;
    };
  };

  outputs = { self, nixpkgs, home-manager, ...}@inputs: 
	let
		inherit (self) outputs;
		lib = nixpkgs.lib // home-manager.lib;
    systems = [
      "x86_64-linux"
      "aarch64-linux"
    ];
    forEachSystem = f: lib.genAttrs systems (system: f pkgsFor.${system});
    pkgsFor = lib.genAttrs systems (
      system:
        import nixpkgs {
          inherit system;
          config.allowUnfree = true;
        }
    );
	in 
	{
		inherit lib;
    nixosModules = import ./modules/nixos;
    homeManagerModules = import ./modules/home-manager;

		overlays = import ./overlays { inherit inputs; };

    pakages = forEachSystem (pkgs: import ./shell.nix {inherit pkgs; });
    devShells = forEachSystem (pkgs: import ./shell.nix { inherit pkgs; });
    formatter = forEachSystem (pkgs: pkgs.alejandra);

		nixosConfigurations = {

			iso = lib.nixosSystem {
				modules = [
					"${nixpkgs}/nixos/modules/installer/cd-dvd/installation-cd-graphical-gnome.nix"
					"${nixpkgs}/nixos/modules/installer/cd-dvd/channel.nix"
					./hosts/iso	
				];
				specialArgs = { inherit inputs outputs; };
			};

			farstar = lib.nixosSystem {
				system = "x86_64-linux";
				modules = [ ./hosts/farstar ];
				specialArgs = { inherit inputs outputs; };
			};
		};

		homeConfigurations = {

			"nixos@iso" = lib.homeManagerConfiguration {
				modules = [ ./homes/nixos-iso/home.nix ];
				pkgs = pkgsFor.x86_64-linux;
				extraSpecialArgs = { inherit inputs outputs; };
			};

			"leto@farstar" = lib.homeManagerConfiguration {
				modules = [ ./home/leto.nix ];
				pkgs = pkgsFor.x86_64-linux;
				extraSpecialArgs = { inherit inputs outputs; };
			};
		};
  };
	
}
