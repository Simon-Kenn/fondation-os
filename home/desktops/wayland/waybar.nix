{
  outputs,
  config,
  lib,
  pkgs,
  inputs,
  ...
}: let
  # Dependencies
  cat = "${pkgs.coreutils}/bin/cat";
  cut = "${pkgs.coreutils}/bin/cut";
  find = "${pkgs.findutils}/bin/find";
  grep = "${pkgs.gnugrep}/bin/grep";
  pgrep = "${pkgs.procps}/bin/pgrep";
  tail = "${pkgs.coreutils}/bin/tail";
  wc = "${pkgs.coreutils}/bin/wc";
  xargs = "${pkgs.findutils}/bin/xargs";
  timeout = "${pkgs.coreutils}/bin/timeout";
  ping = "${pkgs.iputils}/bin/ping";

  jq = "${pkgs.jq}/bin/jq";
  systemctl = "${pkgs.systemd}/bin/systemctl";
  journalctl = "${pkgs.systemd}/bin/journalctl";
  playerctl = "${pkgs.playerctl}/bin/playerctl";
  playerctld = "${pkgs.playerctl}/bin/playerctld";
  pavucontrol = "${pkgs.pavucontrol}/bin/pavucontrol";
  wofi = "${pkgs.wofi}/bin/wofi";

  jsonOutput = name: {
    pre ? "",
    text ? "",
    tooltip ? "",
    alt ? "",
    class ? "",
    percentage ? "",
  }: "${pkgs.writeShellScriptBin "waybar-${name}" ''
    set -euo pipefail
    ${pre}
    ${jq} -cn \
      --arg text "${text}" \
      --arg tooltip "${tooltip}" \
      --arg alt "${alt}" \
      --arg class "${class}" \
      --arg percentage "${percentage}" \
      '{text:$text,tooltip:$tooltip,alt:$alt,class:$class,percentage:$percentage}'
  ''}/bin/waybar-${name}";
in {
  programs.waybar = {
    enable = true;
    settings = [
      {
        mode = "dock";
        layer = "top";
        height = 30;
        margin = "6";
        position = "top";
        modules-left = [
          #"custom/menu"
          "hyprland/workspaces"
          "hyprland/submap"
          "custom/currentplayer"
          "custom/player"
          "tray"
        ];

        modules-center = [
          #"cpu"
          #"memory"
          "clock"
          "pulseaudio"
          "battery"
        ];

        modules-right = [
          "cpu"
          "memory"
          "disk"
          "network"
          "custom/hostname"
        ];
        clock = {
          interval = 1;
          format = "{:%d/%m %H:%M:%S}";
          format-alt = "{:%Y-%m-%d %H:%M:%S %z}";
          on-click-left = "mode";
          tooltip-format = ''
            <big>{:%Y %B}</big>
            <tt><small>{calendar}</small></tt>'';
        };

        cpu = {
          format = "  {usage}%";
        };

        memory = {
          format = "  {}%";
          interval = 5;
        };

        disk = {
          format = "󰋊 {percentage_used}%";
        };

        network = {
          interval = 3;
          format-wifi = "   {signalStrength}% @{essid}";
          format-ethernet = "󰈁    : {bandwidthUpBits}    : {bandwidthDownBits}";
          format-disconnected = "";
          tooltip-format = ''
            {ifname}
            {ipaddr}/{cidr}
              : {bandwidthUpBits} 
              : {bandwidthDownBits}'';
          on-click = "";
        };

        pulseaudio = {
          format = "{icon}  {volume}%";
          format-muted = "   0%";
          format-icons = {
            headphone = "󰋋";
            headset = "󰋎";
            portable = "";
            default = [
              ""
              ""
              ""
            ];
          };
          on-click = pavucontrol;
        };
        idle_inhibitor = {
          format = "{icon}";
          format-icons = {
            activated = "󰒳";
            deactivated = "󰒲";
          };
        };
        battery = {
          bat = "BAT0";
          interval = 10;
          format-icons = [
            "󰁺"
            "󰁻"
            "󰁼"
            "󰁽"
            "󰁾"
            "󰁿"
            "󰂀"
            "󰂁"
            "󰂂"
            "󰁹"
          ];
          format = "{icon} {capacity}%";
          format-charging = "󰂄 {capacity}%";
          onclick = "";
        };
        "custom/hostname" = {
          exec = "echo $USER@$HOSTNAME";
        };
        "custom/currentplayer" = {
          interval = 2;
          return-type = "json";
          exec = jsonOutput "currentplayer" {
            pre = ''
              player="$(${playerctl} status -f "{{playerName}}" 2>/dev/null || echo "No player active" | ${cut} -d '.' -f1)"
              count="$(${playerctl} -l 2>/dev/null | ${wc} -l)"
              if ((count > 1)); then
                more=" +$((count - 1))"
              else
                more=""
              fi
            '';
            alt = "$player";
            tooltip = "$player ($count available)";
            text = "$more";
          };
          format = "{icon}{}";
          format-icons = {
            "No player active" = " ";
            "Celluloid" = "󰎁 ";
            "spotify" = "󰓇 ";
            "ncspot" = "󰓇 ";
            "qutebrowser" = "󰖟 ";
            "firefox" = " ";
            "discord" = " 󰙯 ";
            "sublimemusic" = " ";
            "kdeconnect" = "󰄡 ";
            "chromium" = " ";
          };
          on-click = "${playerctld} shift";
          on-click-right = "${playerctld} unshift";
        };
        "custom/player" = {
          exec-if = "${playerctl} status 2>/dev/null";
          exec = ''${playerctl} metadata --format '{"text": "{{title}} - {{artist}}", "alt": "{{status}}", "tooltip": "{{title}} - {{artist}} ({{album}})"}' 2>/dev/null '';
          return-type = "json";
          interval = 2;
          max-length = 30;
          format = "{icon} {}";
          format-icons = {
            "Playing" = "󰏤";
            "Paused" = "󰐊 ";
            "Stopped" = "󰓛";
          };
          on-click = "${playerctl} play-pause";
        };
      }
    ];
    # Cheatsheet:
    # x -> all sides
    # x y -> vertical, horizontal
    # x y z -> top, horizontal, bottom
    # w x y z -> top, right, bottom, left
    style = let
      inherit (inputs.nix-colors.lib.conversions) hexToRGBString;
      inherit (config.colorscheme) colors;
      toRGBA = color: opacity: "rgba(${hexToRGBString "," color},${opacity})";
    in
      /*
      css
      */
      ''
        * {
          font-family: ${config.fontProfiles.regular.family}, ${config.fontProfiles.monospace.family};
          font-size: 12pt;
          padding: 0;
          margin: 0 0.4em;
        }

        window#waybar {
          padding: 0;
          border-radius: 0.5em;
          background-color: ${toRGBA colors.base00 "0.7"};
          color: #${colors.base05};
        }
        .modules-left {
          margin-left: -0.65em;
        }
        .modules-right {
          margin-right: -0.65em;
        }

        #workspaces button {
          background-color: #${colors.base00};
          color: #${colors.base05};
          padding-left: 0.4em;
          padding-right: 0.4em;
          margin-top: 0.15em;
          margin-bottom: 0.15em;
        }
        #workspaces button.hidden {
          background-color: #${colors.base00};
          color: #${colors.base04};
        }
        #workspaces button.focused,
        #workspaces button.active {
          background-color: #${colors.base0A};
          color: #${colors.base00};
        }

        #clock {
          padding-right: 1em;
          padding-left: 1em;
          border-radius: 0.5em;
        }

        #custom-menu {
          background-color: #${colors.base01};
          padding-right: 1.5em;
          padding-left: 1em;
          margin-right: 0;
          border-radius: 0.5em;
        }
        #custom-menu.fullscreen {
          background-color: #${colors.base0C};
          color: #${colors.base00};
        }
        #custom-hostname {
          padding-right: 1em;
          padding-left: 1em;
          margin-left: 0;
          border-radius: 0.5em;
        }
        #custom-currentplayer {
          padding-right: 0;
        }
        #tray {
          color: #${colors.base05};
        }
        #custom-gpu, #cpu, #memory, #disk {
          margin-left: 0.05em;
          margin-right: 0.55em;
        }
      '';
  };
}
