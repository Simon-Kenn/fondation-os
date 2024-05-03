{outputs, ...}: {
  imports =
    [
      ../core
    ]
    ++ (builtins.attrValues outputs.nixosModules);
}
