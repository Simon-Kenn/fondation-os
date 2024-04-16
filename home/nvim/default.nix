{ inputs, pkgs, ...}: {
  imports = [
    inputs.nixvim.homeManagerModules.nixvim 
    ./vbepo.nix
    ./leadermap.nix
    ./colorscheme.nix
    ./options.nix
		./plugins
  ];

  home.sessionVariables.EDITOR = "nvim";

  programs.nixvim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    package = pkgs.neovim-nightly;
  };
}
