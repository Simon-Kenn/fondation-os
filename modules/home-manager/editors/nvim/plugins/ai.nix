{ pkgs, inputs, ...}: let 
  avente = pkgs.vimUtils.buildVimPlugin {
    version = "latest";
    pname = "avente";
    src = inputs.avente;
  };
in{
  programs.nixvim = {

    extraPlugins = [
      avente
    ];

    extraConfigLua = builtins.readFile ../../neovim/lua/ai.lua;
  };
}
