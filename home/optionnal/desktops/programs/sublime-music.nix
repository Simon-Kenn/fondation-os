{
  pkgs,
  ...
}: {
    home.packages = [pkgs.sublime-music];
    home.persistence = {
      "/persist/home/leto".directories = [".config/sublime-music"];
    };
}
