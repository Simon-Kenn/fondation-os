{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.fdn.hardware.audio;
in {
  options.fdn.hardware.audio = {
    enable = mkEnableOption "Enable audio";
  };

  config = mkIf cfg.enable {
    hardware.pulseaudio.enable = false;

    security.rtkit.enable = true;

    services.pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      jack.enable = true;
      wireplumber.enable = true;
    };

    programs.noisetorch.enable = true;

    environment.systemPackages = with pkgs; [
      headset-charge-indicator
      pulsemixer
    ];
  };
}
