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
    kitty
    wofi
    waybar
    swaylock
    swayidle
    mako
    grim
    slurp
    hyprpaper
    polkit_gnome
  ];

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  xdg.configFile."hypr/hyprland.conf".text = ''
    # Hyprland config (add your other settings here)

    exec-once = waybar
    exec-once = wofi --show drun
  '';
}
