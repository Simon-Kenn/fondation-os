{ config, lib, pkgs, ...}:
with lib; let 
	cfg = config.hm.cli.shells.fish;
	inherit (config.colorScheme) palette;
in {
	options.hm.cli.shells.fish = {
		enable = mkEnableOption "Enable cli shells fish";
	};

	config = mkIf cfg.enable {
		programs.fish = {
			enable = true;

			interactiveShellInit = ''
        set -g fish_color_normal ${palette.base05}
        set -g fish_color_command ${palette.base0D}
        set -g fish_color_param ${palette.base0F}
        set -g fish_color_keyword ${palette.base08}
        set -g fish_color_quote ${palette.base0B}
        set -g fish_color_redirection f4b8e4
        set -g fish_color_end ${palette.base09}
        set -g fish_color_comment 838ba7
        set -g fish_color_error ${palette.base08}
        set -g fish_color_gray 737994
        set -g fish_color_selection --background=${palette.base02}
        set -g fish_color_search_match --background=${palette.base02}
        set -g fish_color_option ${palette.base0B}
        set -g fish_color_operator f4b8e4
        set -g fish_color_escape ea999c
        set -g fish_color_autosuggestion 737994
        set -g fish_color_cancel ${palette.base08}
        set -g fish_color_cwd ${palette.base0A}
        set -g fish_color_user ${palette.base0C}
        set -g fish_color_host ${palette.base0D}
        set -g fish_color_host_remote ${palette.base0B}
        set -g fish_color_status ${palette.base08}
        set -g fish_pager_color_progress 737994
        set -g fish_pager_color_prefix f4b8e4
        set -g fish_pager_color_completion ${palette.base05}
        set -g fish_pager_color_description 737994

			'';
		};
	};
}