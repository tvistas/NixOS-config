{ pkgs }:

pkgs.mkShell {
  name = "website-shell";

  packages = with pkgs; [
    nodejs
  ];

  shellHook = ''
    echo "🌐 Web Dev Environment Loaded!"
    echo "Node version: $(node -v)"
    echo "NPM version: $(npm -v)"

    export NPM_CONFIG_PREFIX="$PWD/.npm-global"
    export PATH="$PWD/.npm-global/bin:$PATH"
  '';
}
