{
  wayland.windowManager.hyprland.settings = {

    #workspace = [
    #  "1, monitor:${host.monitors.main}, default:true"
    #  "2, monitor:${host.monitors.main}, default:true"
    #  "3, monitor:${host.monitors.main}, default:true"
    #  "4, monitor:${host.monitors.main}, default:true"
    #  "5, monitor:${host.monitors.main}, default:true"
    #  "6, monitor:${host.monitors.second}, default:true"
    #  "7, monitor:${host.monitors.second}, default:true"
    #  "8, monitor:${host.monitors.second}, default:true"
    #  "9, monitor:${host.monitors.second}, default:true"
    #  "10, monitor:${host.monitors.second}, default:true"
    #];

    windowrulev2 = [
      "float, class:Wofi"
      "float, class:notification"
      "float, class:download"
      "float, class:dialog"
      "float, class:error"

      "workspace 1, class:(Alacritty),title:(alacritty)"
      "workspace 2, class:(Firefox),title:(firefox)"
      "workspace 8, class:(Alacritty),title:(alacritty)"
      "workspace 9, class:(Logseq),title:(logseq)"
      "workspace 10, class:(Discord),title:(discord)"
    ];
  };
}
