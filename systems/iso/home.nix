{ lib, config, ...}: {
	home = {
		username = lib.mkDefault "nixos";
		homeDirectory = lib.mkDefault "/home/${config.home.username}";
		stateVersion = lib.mkDefault "24.05";
	};
}
