{ ... }:
let
  pkgs = (import <nixpkgs> {});
in {
  chromium = pkgs.chromium;
}
