{
  lib,
  outputs,
  ...
}: {
  imports = builtins.attrValues outputs.nixosModules;
}
