{
  boot = import ./system/boot;
  impermanence = import ./system/impermanence;
  catppuccin = import ./system/catppuccin;
  locale = import ./system/locale;
  nix = import ./system/nix;

  sops = import ./security/sops;
  yubikey = import ./security/yubikey;

  fish = import ./shell/fish;

  audio = import ./hardware/audio;
  video = import ./hardware/video;
  bluetooth = import ./hardware/bluetooth;

  networking = import ./networking;


  hyprland = import ./desktops/hyprland;

  openssh = import ./services/openssh;
  wireguard = import ./services/wireguard;
  avahi = import ./services/avahi;
  homepage-dashboard = import ./services/homepage-dashboard;
  nixarr = import ./services/nixarr;
  paperless = import ./services/paperless;

  user = import ./users/user;
}
