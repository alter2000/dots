{ config, pkgs, ... }:

{
  services = {
    fstrim.enable = true;
    ntp.enable = true;
    tlp.enable = true;

    acpid.enable = true;
    fprintd.enable = true;
    gpm.enable = true;
    xbanish.enable = true;

    # flatpak = {
    #   enable = true;
    #   # extraPortals = [  ];
    # };

    compton = {
      enable = true;
      vSync = "opengl";
      backend = "glx";
      inactiveOpacity = "0.97";
      extraOptions = ''
          shadow-exclude = [
            "name    =  'bar'",
            "name    =  'Notification'",
            "class_g ?= 'Notify-osd'",
            "class_g =  'Conky'",
            "class_g =  'Polybar'",
          ];
          inactive-dim = 0.1;
          inactive-dim-fixed = 0.1;
          inactive-opacity-override = false;
          mark-wmwin-focused = true;
          mark-ovredir-focused = true;
          detect-rounded-corners = true;
          detect-client-opacity = true;
          wintypes: {
            tooltip = { fade = true; shadow = true; opacity = 0.8; };
          };
          opacity-rule = [ "0:_NET_WM_STATE@:32a *= '_NET_WM_STATE_HIDDEN'" ];
        '';
    };

    redshift = {
      enable = true;
      latitude = "50";
      longitude = "10";
      temperature.day = 6300;
      temperature.night = 4200;
      extraOptions = [ "-g 0.8" ];
    };

    locate = {
      enable = true;
      interval = "30min";
    };

    logind = {
      lidSwitch = "suspend";
      lidSwitchDocked = "ignore";
    };

    # mpd = {
    #   enable = true;
    #   user = "alter2000";
    #   musicDirectory = /home/alter2000/lfs/music;
    #   playlistDirectory = "/home/alter2000/lfs/music/.playlists";
    #   dataDir = /home/alter2000/.dots/mpd;
    # };

    offlineimap = {
      enable = true;
      path = [pkgs.bash pkgs.pass pkgs.python];
    };

    openssh = {
      enable = true;
      startWhenNeeded = true;
      allowSFTP = true;
      ports = [40];
      gatewayPorts = "yes";
    };

    # clamav = {
    #   daemon.enable = true;
    #   updater = {
    #     enable = true;
    #     frequency = 3;
    #     interval = "daily";
    #   };
    # };

    thinkfan = {
      enable = true;
      fan = "tp_fan /proc/acpi/ibm/fan";
      levels = ''
        (0,	0,	43)
        (1,	41,	47)
        (2,	46,	52)
        (3,	51,	58)
        (4,	57,	62)
        (5,	60,	66)
        (6,	60,	66)
        (7,	63,	32767)
      '';
      sensors = ''
        hwmon /sys/devices/platform/coretemp.0/hwmon/hwmon2/temp1_input
        hwmon /sys/devices/platform/coretemp.0/hwmon/hwmon2/temp2_input
        hwmon /sys/devices/platform/coretemp.0/hwmon/hwmon2/temp3_input
      '';
      # levels = ''
      #   (0,	0,	47)
      #   (1,	46,	51)
      #   (2,	50,	55)
      #   (3,	54,	58)
      #   (4,	57,	62)
      #   (5,	60,	66)
      #   (6,	55,66)
      #   (7,	63,	32767)
      # '';
    };

    xserver = (import ./xserver.nix { inherit pkgs; });

  };
}
