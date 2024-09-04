{
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.fdn.cli.programs.ssh;
in {
  options.fdn.cli.programs.ssh = {
    enable = mkEnableOption "ssh";
  };

  config = mkIf cfg.enable {
    programs.ssh = {
      enable = true;
      forwardAgent = true;
    };

    home.persistence = {
      "/persist/home/leto".directories = [".ssh"];
    };
  };
}
