{ inputs, pkgs, ...}: {
	imports = [
		inputs.home-manager.nixosModules.home-manager 
	];

	users.extraUsers.root.password = "nixos";
	users.users.nixos = {
		packages = [ pkgs.home-manager ];
	};

	home-manager.users.nixos = import ./home.nix;
}
