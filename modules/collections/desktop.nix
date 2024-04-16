{pkgs, config, ...}:
{
  imports = [
    ../docker.nix
    #../fh/scanning.nix
    ../flatpak.nix
    ../gpg.nix
    ../graphical/audio.nix
    ../graphical/code.nix
    ../graphical/emulators.nix
    ../graphical/gamemode.nix
    ../graphical/games.nix
    ../graphical/ime.nix
    ../graphical/obs.nix
    ../graphical/openrgb.nix
    ../graphical/plasma.nix
    ../graphical/shared.nix
    ../kernel.nix # use latest kernel
    ../nix/index.nix
    ../nix/ld.nix
    ../nix/settings.nix
    ../noise-supression.nix
    ../services/syncthing.nix
    ../static-ip.nix
    ../support/ntfs.nix
  ];

  kop = {
    tmpfs.enable = true;
    wireshark.enable = true;
    virt-manager.enable = true;
    nftables.enable = true;
    cli-tools.enable = true;
    hardware = {
      nvidia.enable = true;
      firmware.enable = true;
      ssd.enable = true;
      wooting.enable = true;
    };
    graphical = {
      audio.enable = true;
      code.enable = true;
      emulators.enable = true;
      gamemode.enable = true;
      games.enable = true;
      ime.enable = true;
      obs.enable = true;
      openrgb.enable = true;
      plasma.enable = true;
      shared.enable = true;
    };
  };
}
