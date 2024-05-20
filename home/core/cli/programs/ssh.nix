{
  programs.ssh = {
    enable = true;
    forwardAgent = true;
  };

  home.persistence = {
    "/persist/home/leto".directories = [".ssh"];
  };
}
