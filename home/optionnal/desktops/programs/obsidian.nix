{pkgs, ...}: {
  home.packages = with pkgs; [
    obsidian
  ];

  home.persistence."/persist/home/leto".directories = [
    ".config/obsidian"
  ];
}
