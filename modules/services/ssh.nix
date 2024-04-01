{
    networking.firewall.allowedTCPPorts = [ 22 ];
    services.openssh = {
        enable = true;
        allowSFTP = false;
        settings.PasswordAuthentication = false;
        settings.KbdInteractiveAuthentication = false;
        settings.X11Forwarding = false;
        settings.PermitRootLogin = "no";
        extraConfig = ''
            AllowAgentForwarding no
            AllowStreamLocalForwarding no
            AuthenticationMethods publickey
        '';
    };
}
