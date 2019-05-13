{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    ag alsaUtils ansible
    calcurse chromium clang ctags
    dia dunst
    elinks exfat
    firefox feh
    git gparted
    htop
    icdiff imagemagick imv
    keynav
    libnotify
    mosh msmtp
    networkmanager neomutt ntfs3g
    offlineimap
    pamixer pandoc parallel pass
    ranger rsync ruby
    slurm stdman
    tlp tmux tree
    urlview usbutils
    virtmanager virt-viewer
    ( vimHugeX.override { python = python3; })
      ansible-lint vim-vint shfmt mypy
    w3m wget
    xarchiver xorg.xev xdotool xclip xsel

    (python37.withPackages(pks: with pks; [
      ipython
      python
      pip
      conda
      virtualenv

      yapf
      neovim
      # terminal_velocity
    ]))

    alacritty
    beets
    gucharmap gvfs
    maim moon-buggy mpc_cli mpd mpv
    neofetch newsboat ncdu ncmpcpp
    pavucontrol pipes pulsemixer pywal
    redshift rofi
    slop sxhkd
    teeworlds termite tig toilet transmission-gtk torbrowser
    unzip
    vagrant
    youtube-dl
    zathura
  ];

  nixpkgs = {
    config = {
      allowUnfree = true;
      packageOverrides = pkgs: {
        polybar = pkgs.polybar.override {
          githubSupport = true;
            # i3Support = true;
            i3GapsSupport = true;
            mpdSupport = true;
          };
        };
      };

      overlays = {
      };
    };
  }
