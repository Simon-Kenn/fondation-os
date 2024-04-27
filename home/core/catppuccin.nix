{inputs, ...}: {
  imports = [
    inputs.catppuccin.homeManagerModules.catppuccin
  ];

  catppuccin = {
    enable = true;
    flavour = "mocha";
    accent = "teal";
  };
}
