{pkgs, ...}: {
  imports = [
    ./waybar.nix
    ./hyprpaper.nix
    ./kanshi.nix
    ./mako.nix
    ./swaylock.nix
    ./wofi.nix
    ./xdg.nix
  ];

  home.packages = with pkgs; [
    grim # Grab image from a Wayland compositor
    gtk3
    imv # image viewer for x11/wayland
    pulseaudio
    slurp # Select a region in a wayland compositor
    waypipe # Proxy for wayland client
    wf-recorder # Screen recording
    wl-clipboard # Command line copy / paste utility
    wl-mirror
    xdg-utils
  ];
}
