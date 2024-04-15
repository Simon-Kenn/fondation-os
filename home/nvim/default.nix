{ inputs, ...}: {
  imports = [
    inputs.nixvim.homeManagerModules.nixvim 
    ./vbepo.nix
    ./options.nix
    ./colorscheme.nix
  ];

  programs.nixvim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    colorscheme = cat
  };
}
