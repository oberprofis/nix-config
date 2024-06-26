{config, lib, ...}:
with lib;
let
    cfg = config.custom.nix.index;
in
{
    options.custom.nix.index = {
        enable = mkEnableOption "Enables nix index";
    };
    
    config = mkIf cfg.enable {
        programs.command-not-found.enable = false;
        programs.nix-index = {
            enable = true;
            enableZshIntegration=true;
        };
    };
}

