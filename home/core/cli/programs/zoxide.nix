{
    programs.zoxide = {
      enable = true;
      enableFishIntegration = true;
    };
  
    home.persistence."/persist/home/leto".directories = [
      ".local/share/zoxide"
    ];
}
