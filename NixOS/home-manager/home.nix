{ config, pkgs, inputs, ... }:
{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "klouwer";
  home.homeDirectory = "/home/klouwer";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "23.11";

  home.packages = with pkgs; [
# Hyprland ecosystem
hyprpaper
hypridle
hyprlock
hyprpicker
hyprcursor
hyprsunset

# Desktop portals (screenshare, Flatpaks, etc.)
xdg-desktop-portal
xdg-desktop-portal-hyprland
hyprlang
hyprutils
hyprwayland-scanner
pipewire

# Wayland / graphics stack
xwayland             # run X11 apps on Wayland

# Audio & screen-sharing
pipewire
wireplumber
pipewire-pulse
pipewire-jack

# Status bars / shells
waybar
ags
eww

# Application launchers & menus
rofi-wayland
wofi
tofi
fuzzel

# Notification daemons
mako
SwayNotificationCenter
fnott
dunst

# Terminal emulators
kitty

# Clipboard, power & misc.
wl-clipboard
cliphist
wlogout
swaylock

# Fonts & icons
ttf-nerd-fonts-symbols
ttf-google-fonts
  ];

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
