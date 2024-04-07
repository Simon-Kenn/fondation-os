{ inputs, outputs, pkgs, ...}: {
	imports = [
		inputs.home-manager.nixosModules.home-manager 
	];

	users.extraUsers.root.password = "nixos";
	users.users.nixos = {
		packages = [ pkgs.home-manager ];
	};

	home-manager.users.nixos = import ./home.nix;
	home-manager.extraSpecialArgs = { inherit inputs outputs; };
}
