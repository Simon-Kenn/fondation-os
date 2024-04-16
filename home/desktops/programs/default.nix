{ pkgs, ...}:{
  imports = [
    ./discord.nix
    ./firefox.nix
    ./pavucontrols.nix
    ./playerctl.nix
    #./sublime-music.nix
  ];

	home.packages = with pkgs; [
		pkgs.element-desktop
	];
}
