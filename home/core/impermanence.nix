{inputs, ...}: {
  imports = [
    inputs.impermanence.nixosModules.home-manager.impermanence
  ];

  home.persistence = {
    "/persist/home/leto" = {
      directories = [
        "Bibliothèque"
        "Notes"
        "Documents"
        "Musiques"
        "Images"
        "Vidéos"
        "Téléchargements"
        "Codes"
        ".local/bin"
        ".local/share/nix"
      ];
      allowOther = true;
    };
  };
}
