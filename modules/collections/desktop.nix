{pkgs, ...}:
{
  imports = [
    ### System modules ###
    ../cli-tools.nix
    ../docker.nix
    ../fh/scanning.nix
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
    #../graphical/lxqt.nix
    ../graphical/plasma.nix
    ../graphical/shared.nix
    ../fh/scanning.nix
    ../hardware/firmware.nix
    ../hardware/nvidia.nix
    ../hardware/ssd.nix
    ../hardware/wooting.nix
    ../kernel.nix # use latest kernel
    ../nftables.nix
    ../nix/index.nix
    ../nix/ld.nix
    ../nix/settings.nix
    ../noise-supression.nix
    ../support/ntfs.nix
    ../tmpfs.nix
    ../virt-manager.nix
    ../static-ip.nix
    ../wireshark.nix
    #../fh/forensik.nix
    #../graphical/hyprland.nix
    #../hardware/vfio.nix too stupid for this
  ];
}
