{ pkgs }:

pkgs.mkShell {
  name = "osiris-shell";

  packages = with pkgs; [
    gcc
    gfortran
    gnumake
    openmpi
    (hdf5.override {
      enableFortran = true;
      mpiSupport = true;
    })
    pkg-config
  ];

  shellHook = ''
    echo "Osiris Dev Environment Loaded!"
  '';
}
