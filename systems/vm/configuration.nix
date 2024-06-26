{ pkgs, config, ... }: {

  age.identityPaths = [ /home/kopatz/.ssh/id_rsa ];
  mainUser.layout = "de";
  mainUser.variant = "us";
  custom = {
    user = {
      name = "vm";
      layout = "de";
      variant = "us";
    };
    cli-tools.enable = true;
    nix = {
      index.enable = true;
      ld.enable = true;
      settings.enable = true;
    };
    services = {
      #adam-site.enable = true;
      kop-fileshare.enable = true;
    };
    graphical = { lxqt.enable = true; };
  };

  environment.systemPackages = [ pkgs.firefox ];
  services.nginx = {
    enable = true;
    virtualHosts = {
      "localhost" = {
        forceSSL = false;
        enableACME = false;
        locations."/".proxyPass = "http://127.0.0.1:4000";
      };
    };
  };
}
