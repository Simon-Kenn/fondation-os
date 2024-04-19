{pkgs, ...}: {
  home.packages = with pkgs; [
    calibre
  ];

  home.persistence."/persist/home/leto".directories = [
    ".config/calibre"
  ];
}
