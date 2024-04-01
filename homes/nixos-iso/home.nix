{ lib, config, ...}: {

	imports = [
		../../modules/home
	];

	home = {
		username = lib.mkDefault "nixos";
		homeDirectory = lib.mkDefault "/home/${config.home.username}";
		stateVersion = lib.mkDefault "24.05";
	};

	modules.home.editors.vim.enable = true;
}
