{ pkgs, ...}:{
	imports = [
		./hyprland
		./wayland
		./programs
		./ui
	];

  home.packages = with pkgs; [
    wl-clipboard
  ];
}
