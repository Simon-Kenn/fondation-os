{pkgs, ...}: let
  custom_mech =
    pkgs.python311Packages.mechanize.overridePythonAttrs
    (old: {doCheck = false;});
  custom_calibre = pkgs.calibre.override (old: {
    python3Packages = old.python3Packages // {mechanize = custom_mech;};
  });
in {
  home.packages = with pkgs; [
    custom_calibre # TODO : Delete
  ];

  home.persistence."/persist/home/leto".directories = [
    ".config/calibre"
  ];
}
