{ lib, config, ...}: {

	imports = [
		../../modules/home
	];

	home = {
		username = lib.mkDefault "nixos";
		homeDirectory = lib.mkDefault "/home/${config.home.username}";
		stateVersion = lib.mkDefault "24.05";
	};

	programs.home-manager.enable = true;
	programs.git.enable = true;

	modules.home = {
		editors.vim.enable = true;
		system.nix.enable = true;
	};
}
