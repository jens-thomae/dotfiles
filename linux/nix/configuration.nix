# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page and in the NixOS manual (accessible by running ‘nixos-help’).
{ config, lib, pkgs, ... }:
let
  unstable = import (fetchTarball "https://github.com/NixOS/nixpkgs/archive/nixos-unstable.tar.gz") { config.allowUnfree = true; };
in { services.pipewire = {
    enable = true;
    alsa.enable = true;  # Enable ALSA support if needed
    pulse.enable = true;  # If you want to use PulseAudio compatibility
  };

  # Enable XDG Portal
  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };

  # Enable dconf
  programs.dconf.enable = true;

  # Enabling flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  imports =
    [ # Include the results of the hardware scan.
      # <home-manager/nixos>
      ./hardware-configuration.nix
      ./modules/nvidia.nix
    ];

  # Set default shell to zsh
  programs.zsh.enable = true;
  users.defaultUserShell = pkgs.zsh;

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Berlin";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "de_DE.UTF-8";
    LC_IDENTIFICATION = "de_DE.UTF-8";
    LC_MEASUREMENT = "de_DE.UTF-8";
    LC_MONETARY = "de_DE.UTF-8";
    LC_NAME = "de_DE.UTF-8";
    LC_NUMERIC = "de_DE.UTF-8";
    LC_PAPER = "de_DE.UTF-8";
    LC_TELEPHONE = "de_DE.UTF-8";
    LC_TIME = "de_DE.UTF-8";
  };

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.jens = {
    isNormalUser = true;
    description = "Jens";
    extraGroups = [ "networkmanager" "wheel" "video"];
  };

  # home-manager.users.jens = import ./home.nix;
  # Backup conflicting files automatically
  # home-manager.backupFileExtension = "backup";

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    ags
    gnome.adwaita-icon-theme
    alacritty
    appimage-run
    appimagekit
    bitwarden-desktop
    bibata-cursors
    gcc
    dconf
    eza
    fastfetch
    firefox
    flatpak-builder
    git
    gnome.adwaita-icon-theme
    gnome-builder
    gnome.gnome-maps
    gnome.gnome-themes-extra
    gnome.nautilus
    glib
    gsettings-desktop-schemas
    gtk3
    gtk4
    hicolor-icon-theme
    hyprlock
    hyprpaper
    iw
    unstable.iplookup-gtk
    loupe
    unstable.mission-center
    neovim
    nodejs_22
    nvtopPackages.nvidia
    opendrop
    owl
    pavucontrol
    pipewire
    planify
    playerctl
    polkit_gnome
    unstable.resources
    ripgrep
    rofi-wayland
    shared-mime-info
    swaynotificationcenter
    spotify
    squashfsTools
    steam
    tracker-miners
    unzip
    wget
    wireplumber
    wl-clipboard
    xdg-desktop-portal
    xdg-desktop-portal-gtk
    xdg-desktop-portal-gnome
    xdg-desktop-portal-hyprland
    xdg-user-dirs
    zsh
  ];

  fonts.packages = with pkgs; [
    nerdfonts
    noto-fonts
    noto-fonts-color-emoji
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };
  programs.hyprland.enable = true;

  # List services that you want to enable:
  services.gvfs.enable = true;

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?

}
