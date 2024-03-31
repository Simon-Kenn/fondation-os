{ lib, config, inputs, ...}: {
	imports = [
		../../modules/home
	];

	home = {
		username = lib.mkDefault "nixos";
		homeDirectory = lib.mkDefault "/home/${config.home.username}";
		stateVersion = lib.mkDefault "24.05";
	};

	modules = {
		cli = {
			editors.vim.enable = true;
		};
	};
}
