{
  boot = import ./system/boot;
  impermanence = import ./system/impermanence;
  catppuccin = import ./system/catppuccin;
  locale = import ./system/locale;
  nix = import ./system/nix;

  fish = import ./shell/fish;

  audio = import ./hardware/audio;
}
