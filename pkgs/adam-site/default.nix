{ lib, buildNpmPackage, fetchFromGitHub }:
buildNpmPackage rec {
  pname = "adam-site";
  version = "1.0.0";

  src = fetchGit {
    url = "git@github.com:oberprofis/adams.git";
    ref = "main";
    rev = "312d6117e00ef4415349d0af1141e4664c8db303";
  };
  npmDepsHash="sha256-ndpuIqMAitnx0rswYD60l5JhDMdaKH77Qdu7zNgwj/o=";
  installPhase = ''
    mkdir -p $out
    cp -r ./dist/adams-site/* $out
  '';
}
