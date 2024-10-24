#{...}:
#{
#  home.file.".config/waybar/config" = {
#    source = ./config;
#  };
#
#  home.file.".config/waybar/style.css" = {
#    source = ./style.css;
#  };

#}



{ pkgs, ... }:

let 
  pactl = "${pkgs.pulseaudioFull}/bin/pactl";

  config = {
    layer = "top";
    modules-left = [ "sway/workspaces" "sway/mode" ];
    modules-right = [
      "idle_inhibitor"
      "pulseaudio"
      "network"
      "cpu"
      "memory"
      "temperature"
      "battery"
      "clock"
      "tray"
    ];
    "sway/workspaces" = {
      all-outputs = true;
      format = "{name}:{icon}";
      format-icons = {
        urgent = "";
        focused = "";
        default = "";
      };
    };
    idle_inhibitor = {
      format = "{icon}";
      format-icons = {
        activated = "";
        deactivated = "";
      };
    };
    tray = {
      icon-size = 21;
      spacing = 5;
    };
    clock = {
      tooltip-format = "{:%Y-%m-%d | %H:%M}";
      format = "{:%F %T %Z}";
    };
    cpu = {
      format = "{usage}% ";
      tooltip = false;
    };
    memory = { format = "{}% "; };
    temperature = {
      hwmon-path = "/sys/class/hwmon/hwmon3/temp1_input";
      critical-threshold = 80;
      format = "{temperatureC}°C {icon}";
      format-icons = [ "" "" "" ];
    };
    battery = {
      states = {
        good = 90;
        warning = 30;
        critical = 15;
      };
      format = "{capacity}% {icon}";
      format-charging = "{capacity}% ";
      format-plugged = "{capacity}% ";
      format-alt = "{time} {icon}";
      format-icons = [ "" "" "" "" "" ];
    };
    network = {
      format-wifi = "{essid} ({signalStrength}%) ";
      format-ethernet = "{ifname}: {ipaddr}/{cidr} ";
      format-linked = "{ifname} (No IP) ";
      format-disconnected = "Disconnected ⚠";
      format-alt = "{ifname}: {ipaddr}/{cidr}";
    };
    pulseaudio = {
      format = "{volume}% {icon} {format_source}";
      format-bluetooth = "{volume}% {icon} {format_source}";
      format-bluetooth-muted = " {icon} {format_source}";
      format-muted = " {format_source}";
      format-source = "{volume}% ";
      format-source-muted = "";
      format-icons = {
        headphones = "";
        handsfree = "";
        headset = "";
        phone = "";
        portable = "";
        car = "";
        default = [ "" "" "" ];
      };
      on-click = "${pactl} set-sink-mute @DEFAULT_SINK@ toggle";
      on-scroll-up = "${pactl} set-sink-volume @DEFAULT_SINK@ +1%";
      on-scroll-down = "${pactl} set-sink-volume @DEFAULT_SINK@ -1%";
    };
  };

in

{

  

  home.file.".config/waybar/config.jsonc" = {
    #text = (builtins.toJSON config.jsonc);
    source = ./config.jsonc;
  };

  home.file.".config/waybar/mouse.sh" = {
    source = ./mouse.sh;
  };

  home.file.".config/waybar/style.css" = {
    source = ./style.css;
  };

}
