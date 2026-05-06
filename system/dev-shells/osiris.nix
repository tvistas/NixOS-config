{
  pkgs ? import <nixpkgs> { },
}:

pkgs.mkShell {
  name = "osiris-shell";

  venvDir = "./.venv";

  packages = with pkgs; [
    gcc
    gfortran
    gnumake
    openmpi
    (hdf5.override {
      fortranSupport = true;
      mpiSupport = true;
      cppSupport = false;
    })
    pkg-config

    python3
    python3Packages.venvShellHook

    gemini-cli
  ];

  LD_LIBRARY_PATH = pkgs.lib.makeLibraryPath (
    with pkgs;
    [
      stdenv.cc.cc.lib
      zlib
    ]
  );

  postVenvCreation = ''
    unset SOURCE_DATE_EPOCH
    pip install --upgrade pip
  '';

  postShellHook = ''
    unset SOURCE_DATE_EPOCH

    echo "Osiris Dev Environment Loaded!"
  '';
}
