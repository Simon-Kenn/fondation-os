{
  boot = import ./system/boot;
  impermanence = import ./system/impermanence;
  catppuccin = import ./system/catppuccin;
  locale = import ./system/locale;
  nix = import ./system/nix;

  sops = import ./security/sops;

  fish = import ./shell/fish;

  audio = import ./hardware/audio;
  video = import ./hardware/video;
  bluetooth = import ./hardware/bluetooth;

  networking = import ./networking;

  openssh = import ./services/openssh;
  avahi = import ./services/avahi;

  gaming = import ./gaming;

  user = import ./users/user;
}
