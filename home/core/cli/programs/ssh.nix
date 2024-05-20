{
  programs.ssh = {
    enable = true;
    forwardAgent = true;
  };

  home.persistence = {
    "/persist/home/leto".files = [".ssh/known_hosts"];
  };
}
