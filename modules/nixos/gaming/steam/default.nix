{ config, lib, pkgs, ...}:
with lib; let 
	cfg = config.os.gaming.steam;
in {

	options.os.gaming.steam = {
		enable = mkEnableOption "Enable steam";
	};

	config = mkIf cfg.enable {

    hardware.steam-hardware.enable = true;

    programs = {
      gamemode.enable = true;
      gamescope.enable = true;
      steam = {
        enable = true;
        package = pkgs.steam.override {
          extraPkgs = p:
            with p; [
              mangohud
              gamemode
            ];
        };
        dedicatedServer.openFirewall = true;
        remotePlay.openFirewall = true;
        gamescopeSession.enable = true;
        extraCompatPackages = with pkgs; [
          proton-ge-bin
        ];
      };
    };

    environment.systemPackages = with pkgs; [
      winetricks
      wineWowPackages.waylandFull
    ];
	};
}
