{ pkgs, ...}: {
	environment.systemPackages = with pkgs; [
		git
		pciutils
		wget
		curl
		sops
		age
		gnupg
		ssh-to-age
	];
}
