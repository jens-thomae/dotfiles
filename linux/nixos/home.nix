{ config, pkgs, ...}:

{
  # Environment variables
    home.sessionVariables = {
      XCURSOR_THEME = "Bibata-Modern-Classic";
      XCURSOR_SIZE = "24";
    };

  home.packages = with pkgs; [];

  home.pointerCursor = {
    gtk.enable = true;
    # x11.enable = true;
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Ice";
    size = 24;
  };

  gtk = {
    enable = true;

    iconTheme = {
      package = pkgs.papirus-icon-theme;
      name = "Papirus";
    };

    font = {
      name = "Sans";
      size = 11;
    };
  };

  wayland.windowManager.hyprland.systemd.variables = ["--all"];

  home.file = {
      # XCursor settings
      ".icons/default/index.theme".text = ''
        [Icon Theme]
        Inherits=Bibata-Modern-Ice
      '';
    };

  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
    };
  };

  # The state version is required and should stay at the version you
  # originally installed.
  home.stateVersion = "24.05";
}
