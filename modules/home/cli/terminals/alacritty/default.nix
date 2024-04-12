{
	config, lib, ...
}:
with lib; let 
	inherit (config.colorScheme) palette;
	cfg = config.hm.cli.terminals.alacritty;
in {
	
	options.hm.cli.terminals.alacritty = {
		enable = mkEnableOption "Enable alacritty terminal emulator";
	};

	config = mkIf cfg.enable {
		home.sessionVariables = {
			TERMINAL = "alacritty";
		};
		programs.alacritty = {
			enable = true;

			settings = {

				window = {
					padding = {
						x = 2;
						y = 2;
					};
				};

				scrolling = {
					history = 10000;
					multiplier = 3;
				};

				font = {
					normal = {
						family = config.desktops.ui.fontProfiles.monospace.family;
						style = "Regular";
					};
					size = 11.0;
				};

				colors = {
					primary = {
						background = "#${palette.base00}";
						foreground = "#${palette.base05}";
						dim_foreground = "#${palette.base05}";
						bright_foreground = "#${palette.base05}";
					};

					cursor = {
						text = "#${palette.base00}";
						cursor = "#${palette.base06}";
					};

					vi_mode_cursor = {
						text = "#${palette.base00}";
						cursor = "#${palette.base07}";
					};

					search = {
						matches = {
							foreground = "#${palette.base00}";
							background = "#${palette.base01}"; # TODO: Change
						};
						focused_match = {
							foreground = "#${palette.base00}";
							background = "#${palette.base0B}";
						};
					};

					hints = {
						start = {
							foreground = "#${palette.base00}";
							background = "#${palette.base0A}";
						};
						end = {
							foreground = "#${palette.base00}";
							background = "#${palette.base06}";
						};
					};

					footer_bar= {
						foreground = "#${palette.base00}";
						background = "#${palette.base01}";
					};
					normal = {
						black = "#${palette.base03}";
						red = "#${palette.base08}";
						green = "#${palette.base0B}";
						yellow = "#${palette.base0A}";
						blue = "#${palette.base0D}";
						magenta = "#${palette.base06}";
						cyan = "#${palette.base0C}";
						white = "#${palette.base05}";
					};

					bright = {
						black = "#${palette.base04}";
						red = "#${palette.base08}";
						green = "#${palette.base0B}";
						yellow = "#${palette.base0A}";
						blue = "#${palette.base0D}";
						magenta = "#${palette.base06}";
						cyan = "#${palette.base0C}";
						white = "#${palette.base05}";
					};

					dim = {
						black = "#${palette.base03}";
						red = "#${palette.base08}";
						green = "#${palette.base0B}";
						yellow = "#${palette.base0A}";
						blue = "#${palette.base0D}";
						magenta = "#${palette.base06}";
						cyan = "#${palette.base0C}";
						white = "#${palette.base05}";
					};
				};

				bell = {
					animation = "EaseOutExpo";
					duration = 0;
					command = "None";
				};

				#selection = {
				#	save_to_clipboard = false;
				#};
			};
		};
	};
}
