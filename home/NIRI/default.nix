{ config, pkgs, lib, inputs, ... }:

{
	programs.niri.config = builtins.readFile ./config.kdl;
}
