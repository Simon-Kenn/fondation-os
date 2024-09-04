{
  config,
  lib,
  inputs,
  ...
}:
with lib; let
  cfg = config.fdn.system.impermanence;
in {
  options.fdn.system.impermanence = {
    enable = mkEnableOption "impermanence";
  };

  imports = [
    inputs.impermanence.nixosModules.home-manager.impermanence
  ];

  # TODO: make the folder configurable outside the menu
  config = mkIf cfg.enable {
    home.persistence = {
      "/persist/home/leto" = {
        directories = [
          "Bibliothèque"
          "Notes"
          "CerveauII"
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
  };
}
