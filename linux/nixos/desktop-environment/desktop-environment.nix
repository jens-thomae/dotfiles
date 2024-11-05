{ config, pkgs, lib, ... }:

let
  unstable = import (fetchTarball "https://github.com/NixOS/nixpkgs/archive/nixos-unstable.tar.gz") { config.allowUnfree = true; };
in 
{
  # Packages relevant for the desktop environment
  environment.systemPackages = with pkgs; [
    bibata-cursors
    desktop-file-utils
    adw-gtk3
    gnome.gnome-font-viewer
    ags
    gnome.adwaita-icon-theme
    gnome.gnome-themes-extra
    gnome.nautilus
    squashfsTools
    shared-mime-info
    tracker-miners
    gsettings-desktop-schemas
    gtk3
    gtk4
    hicolor-icon-theme
    unstable.hyprland
    unstable.hyprlock
    hyprpaper
    hyprpicker
    loupe
    unstable.mission-center
    playerctl
    polkit_gnome
    rofi-wayland
    wireplumber
    wl-clipboard
    xdg-user-dirs
    xdg-utils
    pipewire
    swaynotificationcenter
  ];

  # Programs which need to be enabled for the de
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };
  
  # Set the cursor theme for gtk
  programs.dconf.profiles = {
    user = {
      databases = [{
        settings = {
          "org/gnome/desktop/interface" = {
            cursor-theme = "Bibata-Modern-Ice";
  	    cursor-size = lib.gvariant.mkInt32 24;
	    gtk-theme = "adw-gtk3";
  	  };
        };
      }];
    };
  };

  # Services
  services.pipewire = {
    enable = true;
    alsa.enable = true;  # Enable ALSA support if needed
    pulse.enable = true;  # If you want to use PulseAudio compatibility
  };
  services.gvfs.enable = true;
  services.flatpak.enable = true;
  security.rtkit.enable = true;
  services.dbus = {
    enable = true;
    packages = [ pkgs.at-spi2-core ];
  };

  hardware.bluetooth.enable = true;
  programs.dconf.enable = true;
  security.polkit.enable = true;
  services.accounts-daemon.enable = true;
  services.dleyna-renderer.enable = true;
  services.dleyna-server.enable = true;
  services.power-profiles-daemon.enable = true;
  services.gnome.at-spi2-core.enable = true;
  services.gnome.evolution-data-server.enable = true;
  services.gnome.gnome-keyring.enable = true;
  services.gnome.gnome-online-accounts.enable = true;
  services.gnome.tracker-miners.enable = true;
  services.gnome.tracker.enable = true;
  services.hardware.bolt.enable = true;
  services.udisks2.enable = true;
  services.upower.enable = config.powerManagement.enable;
  services.libinput.enable = true; # for controlling touchpad settings via gnome control center

  xdg.mime.enable = true;
  xdg.icons.enable = true;

  # Enable XDG Portal
  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-hyprland
      xdg-desktop-portal-gtk
    ];
    config.common.default = "*";
  };

  # Setting XDG env vars
  environment.sessionVariables = {
    XDG_CACHE_HOME  = "$HOME/.cache";
    XDG_CONFIG_HOME = "$HOME/.config";
    XDG_DATA_HOME   = "$HOME/.local/share";
    XDG_STATE_HOME  = "$HOME/.local/state";
  };

  # X11 and Xwayland cursor configuration
  environment.etc."X11/Xresources".text = ''
    Xcursor.theme: Bibata-Modern-Ice
    Xcursor.size: 24
  '';

  # Ensure the cursor theme is available system-wide
  environment.sessionVariables = {
    XCURSOR_THEME = "Bibata-Modern-Ice";
    XCURSOR_SIZE = "24";
  };

  system.userActivationScripts = {
      setupCursor = {
        text = ''
          mkdir -p $HOME/.icons
          ln -sf ${pkgs.bibata-cursors}/share/icons/* $HOME/.icons/
          
          # Create index.theme if it doesn't exist
          if [ ! -f "$HOME/.icons/default/index.theme" ]; then
            mkdir -p "$HOME/.icons/default"
            cat > "$HOME/.icons/default/index.theme" << EOF
  [Icon Theme]
  Inherits=Bibata-Modern-Ice
  EOF
          fi
        '';
      };
    };

}
