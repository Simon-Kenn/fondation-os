{
  programs.ssh = {
    enable = true;
  };
  services.ssh-agent.enable = true;

  home.persistence = {
    "/persist/home/leto".directories = [".ssh"];
  };
}
