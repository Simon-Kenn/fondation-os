{pkgs, ...}: {
  home.packages = with pkgs; [
    anki-bin
  ];

  home.persistence."/persist/home/leto".directories = [
    ".local/share/Anki2"
  ];
}
