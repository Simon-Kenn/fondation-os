{ pkgs, ...}:{
	imports = [
		./hyprland
		./wayland
		./programs
		./ui
    ./gaming
	];

  home.packages = with pkgs; [
    wl-clipboard
  ];
}
