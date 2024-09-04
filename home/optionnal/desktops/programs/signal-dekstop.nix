{pkgs, ...}: {
    home.packages = with pkgs; [
      signal-desktop
    ];
  
    home.persistence."/persist/home/leto".directories = [
      ".config/Signal"
    ];
}
