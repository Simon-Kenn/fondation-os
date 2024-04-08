{ lib, config, outputs, ...}: 
with lib; let 
	cfg = config.os.system.nix;
in {

	options.os.system.nix = { 
		enable = mkEnableOption "Wether or not to manage nixkpgs";
	};

	config = mkIf cfg.enable {
		nixpkgs = {
			hostPlatform = lib.mkDefault "x86_64-linux";
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
