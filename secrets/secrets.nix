let
  kop = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFeP6qtVqE/gu72ZUZE8cdRi3INiUW9NqDR7SjXIzTw2 lukas@Kopatz-PC2";
  server = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIAUA7uVKXAF2UcwaIDSJP2Te8Fi++2zkKzSPoRx1vQrI root@server";
  laptop = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDqcphdDEJhnSBkAZzQXZJDCzsyb/Tqpcf0pUADFpbd1 root@nix-laptop";
  mini-pc = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKla9+Gj2i9Ax7cIdnTM6zsmze3g1N/qCPqhga0P+toU root@mini-pc";
  mini-pc-proxmox = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIP0kX32LfIOv8FDVvdp7lWesVvMGh5tj84nv7TkIR1cs root@mini-pc";
  adam-site = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIAfaIaKoNStnbfjB9cSJ9+PW0BVO3Uhh1uIbZA2CszDE root@nixos";
  users = [ kop ];
  systems = [ mini-pc mini-pc-proxmox server laptop ];
in
{
  "github-runner-token.age".publicKeys = [ mini-pc mini-pc-proxmox server kop ];
  "github-runner-pw.age".publicKeys = [ mini-pc mini-pc-proxmox server kop ];
  "duckdns.age".publicKeys = [ mini-pc mini-pc-proxmox server kop ];
  "nextcloud-admin.age".publicKeys = [ mini-pc mini-pc-proxmox server kop ];
  "nextcloud-cert.age".publicKeys = [ mini-pc mini-pc-proxmox server kop ];
  "nextcloud-key.age".publicKeys = [ mini-pc mini-pc-proxmox server kop ];
  "restic-pw.age".publicKeys = [ mini-pc mini-pc-proxmox server kop ];
  "restic-s3.age".publicKeys = [ mini-pc mini-pc-proxmox server kop ];
  "restic-gdrive.age".publicKeys = [ mini-pc mini-pc-proxmox server kop ];
  "wireguard-private.age".publicKeys = [ mini-pc mini-pc-proxmox server kop ];
  "wireguard-client.age".publicKeys = [ kop laptop ];
  "coturn-secret.age".publicKeys = [ mini-pc mini-pc-proxmox server kop ];
  "matrix-registration.age".publicKeys = [ mini-pc mini-pc-proxmox server kop ];
  "paperless.age".publicKeys = [ mini-pc mini-pc-proxmox server kop ];
  "kavita.age".publicKeys = [ mini-pc mini-pc-proxmox server kop ];
  "step-ca-pw.age".publicKeys = [ mini-pc mini-pc-proxmox server kop ];
  "step-ca-key.age".publicKeys = [ mini-pc mini-pc-proxmox server kop ];
  "grafana-contact-points.age".publicKeys = [ mini-pc mini-pc-proxmox server kop ];
  "fileshelter-conf.age".publicKeys = [ mini-pc mini-pc-proxmox server kop ];
  "webhook.age".publicKeys = [ mini-pc mini-pc-proxmox server kop ];
  "stash-auth.age".publicKeys = [ mini-pc mini-pc-proxmox server kop ];
  "plausible-admin.age".publicKeys = [ adam-site kop ];
  "plausible-keybase.age".publicKeys = [ adam-site kop ];
  "adminarea.age".publicKeys = [ adam-site kop ];
  "radicale.age".publicKeys = [ mini-pc mini-pc-proxmox kop ];
}
