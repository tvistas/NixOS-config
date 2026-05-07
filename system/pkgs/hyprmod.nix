{ inputs, pkgs }:

let
  workspace = inputs.uv2nix.lib.workspace.loadWorkspace {
    workspaceRoot = inputs.hyprmod;
  };
  overlay = workspace.mkPyprojectOverlay {
    sourcePreference = "wheel";
  };
  python = pkgs.python312.override {
    packageOverrides = overlay;
  };
in
python.pkgs.mkVirtualEnv "hyprmod-env" workspace.deps.default
