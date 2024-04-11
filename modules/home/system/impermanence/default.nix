{ config, lib, inputs, ...}: 
with lib; let 
	cfg = config.hm.system.impermanence;
in {
	options.hm.system.impermanence = {
		enable = mkEnableOption "Enable nix options";
	};

	imports = [ inputs.impermanence.nixosModules.home-manager.impermanence ];

	config = mkIf cfg.enable {
		home.persistence = {
			"/persist/home/leto" = {
				directories = [
					"Codes"
					".config"
					".ssh"
					".vim"
				];
				allowOther = true;
			};
		};
	};
}
