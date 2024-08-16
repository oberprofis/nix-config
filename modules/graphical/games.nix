{ config, lib, pkgs, ... }:
with lib;
let cfg = config.custom.graphical.games;
in {
  options.custom.graphical.games = { enable = mkEnableOption "Enables games"; };

  config = mkIf cfg.enable {
    programs.steam = {
      enable = true;
      remotePlay.openFirewall =
        true; # Open ports in the firewall for Steam Remote Play
      dedicatedServer.openFirewall =
        true; # Open ports in the firewall for Source Dedicated Server
      gamescopeSession.enable = true;
      extraCompatPackages = with pkgs; [ proton-ge-bin ];
    };
    environment.systemPackages = with pkgs; [
      taisei
      osu-lazer-bin
      wineWowPackages.unstableFull
      winetricks
      lutris
      mangohud
      prismlauncher
      #tetrio-desktop #fuck you osk
      #libs
    ];
  };
}
