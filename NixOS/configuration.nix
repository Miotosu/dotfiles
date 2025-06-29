{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
  ];

  system.stateVersion = "24.05"; # ← Set this to your installed NixOS version

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.networkmanager.enable = true;
  networking.useDHCP = false;
  networking.interfaces.wlan0.useDHCP = true; # Or your actual device (e.g., `wlp2s0`)

  time.timeZone = "Europe/Zurich";

  i18n.defaultLocale = "en_US.UTF-8";
  console.keyMap = "us";

  # Enable greetd with Hyprland session
  services.xserver.enable = true;
  services.xserver.displayManager.greetd.enable = true;
  services.greetd.settings = {
    default_session.command = "Hyprland";
  };

  # Enable Wayland compositor: Hyprland
  programs.hyprland.enable = true;

  # Input (touchpad, mouse, etc.)
  services.libinput.enable = true;

  # Audio via PipeWire
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    pulse.enable = true;
    jack.enable = false;
  };

  # Define a desktop user (change 'nixos' and password if needed)
  users.users.nixos = {
    isNormalUser = true;
    initialPassword = "nixos"; # Change this after first login!
    extraGroups = [ "wheel" "networkmanager" "audio" "video" ];
  };

  # Allow sudo
  security.sudo.enable = true;

  environment.systemPackages = with pkgs; [
    hyprland
    waybar
    rofi-wayland
    kitty
    foot
    wofi
    grim
    slurp
    wl-clipboard
    brightnessctl
    networkmanagerapplet
    pavucontrol
    firefox
    neovim
    git
  ];
}