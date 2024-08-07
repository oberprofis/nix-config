{ lib, config, pkgs, inputs, pkgsVersion, ... }:
let cfg = config.custom.hardware.nvidia;
in {
  options.custom.hardware.nvidia = {
    enable = lib.mkEnableOption "Enables nvidia gpus";
  };

  config = let
    # the option was renamed in unstable
    nvidiaOption =
      if (pkgsVersion == inputs.nixpkgs-unstable) then {
        hardware.graphics = {
          enable = true;
          enable32Bit = true;
        };
      } else {
        hardware.opengl = {
          enable = true;
          driSupport = true;
          driSupport32Bit = true;
        };
      };
  in lib.mkIf cfg.enable (lib.recursiveUpdate nvidiaOption {
    boot.kernelParams = [ "nvidia-drm.fbdev=1" ];
    services.xserver.videoDrivers = [ "nvidia" ];
    hardware.nvidia = {
      # Modesetting is required.
      modesetting.enable = true;
      # Nvidia power management. Experimental, and can cause sleep/suspend to fail.
      powerManagement.enable = false;
      # Fine-grained power management. Turns off GPU when not in use.
      # Experimental and only works on modern Nvidia GPUs (Turing or newer).
      powerManagement.finegrained = false;
      # Use the NVidia open source kernel module (not to be confused with the
      # independent third-party "nouveau" open source driver).
      # Support is limited to the Turing and later architectures. Full list of 
      # supported GPUs is at: 
      # https://github.com/NVIDIA/open-gpu-kernel-modules#compatible-gpus 
      # Only available from driver 515.43.04+
      # Currently alpha-quality/buggy, so false is currently the recommended setting.
      open = true;
      # Enable the Nvidia settings menu,
      # accessible via `nvidia-settings`.
      nvidiaSettings = true;
      # Optionally, you may need to select the appropriate driver version for your specific GPU.
      package = config.boot.kernelPackages.nvidiaPackages.beta;
    };
  });
}
