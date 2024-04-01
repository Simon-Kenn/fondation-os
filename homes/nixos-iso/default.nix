{ lib, config, inputs, ...}: {
	imports = [
		inputs.home-manager.nixosModules.home-manager 
	];

	users.extraUsers.root.password = "nixos";


	home-manager.users.nixos = import ./home.nix;
}
