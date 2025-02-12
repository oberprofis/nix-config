{ osConfig, pkgs, config, lib, ... }:
let cfg = osConfig.custom.graphical.stylix;
in {
  config = lib.mkIf cfg.enable {
    stylix = {
      enable = true;
      targets = {
        hyprlock.enable = false;
        hyprland.enable = false;
        waybar.enable = false;
      };
    };
  };
}
