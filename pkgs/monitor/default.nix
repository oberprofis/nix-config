{ rustPlatform
, lib
, pkgs
, ...
}:
rustPlatform.buildRustPackage {
  pname = "kop-monitor";
  version = "1.0.0";

  src = fetchGit {
    url = "git@github.com:kropatz/monitor.git";
    ref = "master";
    rev = "0e460dd24f73e060acf9f16e84b45aea97781151";
  };

  nativeBuildInputs = with pkgs; [ pkg-config ];
  buildInputs = with pkgs; [ openssl ];

  cargoHash = "sha256-/bpxo5LUrdMJBzI6N4Dr+f7/pH6fE+fayzZW3CZ/lwA=";
}
