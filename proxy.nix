{ ... }:
let
  pkgs = (import <nixpkgs> { config.allowUnfree = true; config.proxy = "http://127.0.0.1:8123";});

in {

  libev = pkgs.libev;

}
