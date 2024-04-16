{ config, pkgs, inputs, lib, ... }:
with lib;
let
  cfg = config.kop.graphical.shared;
in
{
  options.kop.graphical.shared = {
    enable = mkEnableOption "Enables shared";
  };
  
  config = let
    screenshot = pkgs.writeShellScriptBin "screenshot.sh" ''
      ${pkgs.scrot}/bin/scrot -fs - | ${pkgs.xclip}/bin/xclip -selection clipboard -t image/png -i
    '';
  in mkIf cfg.enable {
    programs.dconf.enable = true;
    programs.kdeconnect.enable = true;
  
    fonts.fontDir.enable = true;
    fonts.packages = with pkgs; [
      uw-ttyp0
      corefonts
      nerdfonts
      noto-fonts
      noto-fonts-emoji
      noto-fonts-cjk 
    ];
  
    networking.firewall = {
      enable = true;
      allowedTCPPorts = [ 53317 ]; #localsend
      allowedUDPPorts = [ 1194 53317 ]; #openvpn, localsend
      allowedTCPPortRanges = [
        { from = 1714; to = 1764; } # KDE Connect
      ];
      allowedUDPPortRanges = [
        { from = 1714; to = 1764; } # KDE Connect
      ];
    };
  
    # Allow unfree packages
    nixpkgs.config.allowUnfree = true;
    services.xserver.wacom.enable = true;
  
    # List packages installed in system profile. To search, run:
    # $ nix search wget
    environment.systemPackages = with pkgs; [
      keepassxc
      xfce.thunar
      remmina
      thunderbird
      rofi
      localsend
      #element-desktop
      krita
      libreoffice-fresh
      screenshot
      anki
      mpv
      p7zip
      qbittorrent
      brightnessctl
      wacomtablet
      wl-clipboard
      libsForQt5.kolourpaint
      libsForQt5.kcalc
      syncthingtray
    ];
  };
}
