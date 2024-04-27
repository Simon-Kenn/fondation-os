{pkgs, ...}: {
  programs.yazi = {
    enable = true;
    enableFishIntegration = true;
    catppuccin.enable = true;
  };

  home.packages = with pkgs; [
    imagemagick
    ffmpegthumbnailer
    fontpreview
    unar
    poppler
    unar
  ];
}
