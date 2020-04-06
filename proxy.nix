{ ... }:
let
  pkgs = (import <nixpkgs> { config.allowUnfree = true;});

in {

  libev = pkgs.libev;

}
