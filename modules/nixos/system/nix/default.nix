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

        substituters = [
          # high priority since it's almost always used
          "https://cache.nixos.org?priority=10"

          "https://anyrun.cachix.org"
          "https://hyprland.cachix.org"
          "https://nix-community.cachix.org"
          "https://nix-gaming.cachix.org"
          "https://yazi.cachix.org"
          "https://ags.cachix.org"
        ];

        trusted-public-keys = [
          "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="

          "anyrun.cachix.org-1:pqBobmOjI7nKlsUMV25u9QHa9btJK65/C8vnO3p346s="
          "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
          "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
          "nix-gaming.cachix.org-1:nbjlureqMbRAxR1gJ/f3hxemL9svXaZF/Ees8vCUUs4="
          "yazi.cachix.org-1:Dcdz63NZKfvUCbDGngQDAZq6kOroIrFoyO064uvLh8k="
          "ags.cachix.org-1:naAvMrz0CuYqeyGNyLgE010iUiuf/qx6kYrUv3NwAJ8="
        ];

      };
      gc = {
        automatic = true;
        dates = "weekly";
        options = "--delete-older-than 7d";
      };
    };
  };
}
