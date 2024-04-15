{ pkgs, ...}:{
  programs.mangohud = {
    enable = true;
    enableSessionWide = true;
    settings = {
      cpu_load_change = true;
    };
  };

  home.packages = with pkgs; [
    lutris
    bottles
    adwsteamgtk
    steam
  ];

  home.persistence."/persist/home/leto" = {
    allowOther = true;
    directories = [
      {
        directory = ".local/share/Steam";
        method = "symlink";
      }
    ];
  };
}
