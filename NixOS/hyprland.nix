{ pkgs, ... }:

{
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
    settings = {
      # Execute your programs on startup
      exec-once = "waybar";

      # Set a keybind for wofi (Mod + D)
      bind = "SUPER, D, exec, wofi --show drun";
    };
  };

  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-hyprland ];
  };
}
