{pkgs, ...}: {
  home.packages = with pkgs; [
    element-desktop
  ];

  home.persistence."/persist/home/leto".directories = [
    ".config/Element"
  ];
}
