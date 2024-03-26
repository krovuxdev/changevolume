{
  system,
  pkgs,
}:
pkgs.stdenv.mkDerivation {
  name = "changevolume";
  version = "1.0";
  src = ../.;
  meta = with pkgs.lib; {
    homepage = "https://github.com/krovuxdev/changevolume";
    description = "My Changevolume is Control Volume";
    license = licenses.mit;
    platforms = platforms.linux;
    mainProgram = "changevolume";
  };
}
