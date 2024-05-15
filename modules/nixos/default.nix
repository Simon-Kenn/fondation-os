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

  openssh = import ./services/openssh;
  avahi = import ./services/avahi;
  servarr = import ./services/servarr;
  homepage-dashboard = import ./services/homepage-dashboard;

  gaming = import ./gaming;

  user = import ./users/user;
}
