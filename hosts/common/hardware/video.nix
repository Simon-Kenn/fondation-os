{
	pkgs,
  ...
}:
{
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
}
