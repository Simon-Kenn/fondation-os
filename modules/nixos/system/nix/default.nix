{
  config,
  lib,
  outputs,
  ...
}:
with lib; let
  cfg = config.fdn.system.nix;
in {
  options.fdn.system.nix = {
    enable = mkEnableOption "Enable nix management";
  };

  config = mkIf cfg.enable {
    nixpkgs = {
      config = {
        allowUnfree = true;
      };
      overlays = builtins.attrValues outputs.overlays;
    };

    nix = {
      settings = {
        trusted-users = ["root" "@wheel"];
        auto-optimise-store = lib.mkDefault true;
        use-xdg-base-directories = true;
        experimental-features = ["nix-command" "flakes" "repl-flake"];
        warn-dirty = false;
      };
      gc = {
        automatic = true;
        dates = "weekly";
        options = "--delete-older-than 7d";
      };
    };
  };
}
