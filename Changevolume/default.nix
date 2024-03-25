{pkgs}:
pkgs.stdenv.mkDerivation {
  name = "changevolume";
  version = "1.0";
  src = ./.;
  #buildInputs = [(import ./changevolume.nix {})];
  meta = with pkgs.lib; {
    description = "My Changevolume is Control Volume";
    license = licenses.mit;
    platforms = platforms.all;
  };
}
