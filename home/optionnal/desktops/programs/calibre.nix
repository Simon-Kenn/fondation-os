{pkgs, ...}: 
{
  home.packages = with pkgs; [
    calibre # TODO : Delete
  ];

  home.persistence."/persist/home/leto".directories = [
    ".config/calibre"
  ];
}
