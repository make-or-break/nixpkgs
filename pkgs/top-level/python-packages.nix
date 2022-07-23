{ pkgs, ... }:

let
  callPackage = pkgs.python3Packages.callPackage;
in
{

  discordpy = callPackage ../development/python-modules/discordpy { };

}
