{
  services.kanshi = {
    enable = true;
    systemdTarget = "";
    profiles = {
      home = {
        outputs = [
          {
            criteria = "edP-1";
            scale = 1.0;
            status = "disable";
          }
          {
            criteria = "HDMI-A-2";
            mode = "1920x1080";
          }
        ];
      };
      default = {
        outputs = [
          {
            criteria = "edP-1";
            scale = 1.0;
            status = "enable";
          }
        ];
      };
    };
  };
}

