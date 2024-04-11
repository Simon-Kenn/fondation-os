{ lib, config, outputs, ...}: 
with lib; let 
	cfg = config.hm.system.nix;
in {

	options.hm.system.nix = {
		enable = mkEnableOption "Wether or not to manage nixkpgs";
	};

	config = mkIf cfg.enable {
		nixpkgs = {
			config = {
				allowUnfree = true;
				allowUnfreePredicate = _: true;
			};
			overlays = builtins.attrValues outputs.overlays;
		};

    nix = {
      settings = {
        trusted-substituters = [
          "https://cache.nixos.org"
          "https://nix-community.cachix.org"
        ];

        trusted-public-keys = [
          "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
          "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
        ];

        experimental-features = ["nix-command" "flakes" "repl-flake"];
        warn-dirty = false;
        use-xdg-base-directories = true;
        netrc-file = "$HOME/.config/nix/netrc";
      };
    };
	};
}
