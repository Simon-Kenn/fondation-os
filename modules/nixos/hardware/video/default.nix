{
  config,
  lib,
	pkgs,
  ...
}:
with lib; let
  cfg = config.os.hardware.video;
in {
  options.os.hardware.video = {
    enable = mkEnableOption "Enable video";
  };

  config = mkIf cfg.enable {
		hardware = {
			opengl = {
				enable = true;
				extraPackages = with pkgs; [
					mesa
				];
				driSupport = true;
				driSupport32Bit = true;
			};
		};

		programs.dconf.enable = true;
  };
}


