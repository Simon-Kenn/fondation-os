{inputs, ...}: {
  imports = [
    inputs.catppuccin.homeManagerModules.catppuccin
  ];

  catppuccin = {
    enable = true;
    flavor = "mocha";
    accent = "teal";
    pointerCursor = {
      enable = true;
    };
  };
}
