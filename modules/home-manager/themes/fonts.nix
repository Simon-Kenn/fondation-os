{
  lib,
  config,
  pkgs,
  ...
}: let
  cfg = config.fdn.themes.fonts;
in {
  options.fdn.themes.fonts = {
    enable = lib.mkEnableOption "Whether to enable font profiles";
  };

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      # icon fonts
      material-symbols

      # Sans(Serif) fonts
      noto-fonts
      noto-fonts-cjk
      noto-fonts-emoji
      roboto
      (google-fonts.override {fonts = ["Inter"];})

      # monospace fonts
      jetbrains-mono

      # nerdfonts
      (nerdfonts.override {fonts = ["NerdFontsSymbolsOnly"];})
    ];

    fonts = {
      # user defined fonts
      # the reason there's Noto Color Emoji everywhere is to override DejaVu's
      # B&W emojis that would sometimes show instead of some Color emojis
      fontconfig = {
        enable = true;
        defaultFonts = let
        addAll = builtins.mapAttrs (_: v: ["Symbols Nerd Font"] ++ v ++ ["Noto Color Emoji"]);
      in
        addAll {
          serif = ["Noto Serif"];
          sansSerif = ["Inter"];
          monospace = ["JetBrains Mono"];
          emoji = [];
        };
      };
    };
  };
}
