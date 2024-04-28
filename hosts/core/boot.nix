{pkgs, ...}: {
  boot = {
    kernelPackages = pkgs.linuxPackages_latest;

    loader = {
      systemd-boot = {
        enable = true;
        consoleMode = "max";
      };
      efi.canTouchEfiVariables = true;
    };

    plymouth = {
      enable = true;
      theme = "catppuccin-mocha";
      themePackages = [(pkgs.catppuccin-plymouth.override {variant = "mocha";})];
    };

    loader.timeout = 0;
    kernelParams = [
      "quiet"
      "loglevel=3"
      "systemd-show_status=auto"
      "rd.udev.log_level=3"
      "vt.global_cursor_default=0"
    ];

    consoleLogLevel = 0;
    initrd.verbose = false;
  };
}
