{ config, pkgs, ... }:

{
  imports = [ ./hardware-configuration.nix ];

  system.stateVersion = "24.05"; # Match your installed version

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.networkmanager.enable = true;
  networking.useDHCP = false;
  networking.interfaces.wlan0.useDHCP = true;

  time.timeZone = "Europe/Zurich";
  i18n.defaultLocale = "en_US.UTF-8";
  console.keyMap = "us";

  services.xserver.enable = true;
  services.xserver.displayManager.greetd.enable = true;
  services.greetd.settings.default_session.command = "Hyprland";

  programs.hyprland.enable = true;
  services.libinput.enable = true;

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    pulse.enable = true;
  };

  users.users.nixos = {
    isNormalUser = true;
    initialPassword = "nixos";
    extraGroups = [ "wheel" "networkmanager" "audio" "video" ];
  };

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
    git
  ];
}