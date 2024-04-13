{ config, lib, pkgs, ...}:
with lib; let 
	cfg = config.hm.cli.programs.yazi;
in {
	options.hm.cli.programs.yazi = {
		enable = mkEnableOption "Enable yazi";
	};

	config = mkIf cfg.enable {
		programs.yazi = {
			enable = true;
			enableFishIntegration = true;
		};

		home.packages = with pkgs; [
			imagemagick
      ffmpegthumbnailer
      fontpreview
      unar
      poppler
      unar
		];
	};
}
