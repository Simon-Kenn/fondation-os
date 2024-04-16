{ inputs, outputs, ...}:
{
	#neorg = inputs.neorg-overlay.overlays.default;
	#neorg = final.vimUtils.buildVimPlugin {
	#	pname = "neorg";
	#	version = "v7.0.0";
	#}

	neovim = inputs.neovim-nightly-overlay.overlay;

	#modifications = final: prev: {
	#	vimPlugins.neorg = prev.vimPlugins.extands {
	#	};
	#};
}
