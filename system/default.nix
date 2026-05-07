let
  subdirs = builtins.readDir ./.;

  modulesDirs = builtins.filter (name: subdirs.${name} == "directory") (builtins.attrNames subdirs);

  modules = map (dir: ./${dir}) modulesDirs;
in

{
  imports = modules;
}
