{ ... }:
let
  pkgs = (import <nixpkgs> { config.allowUnfree = true;});
  
in {

  my-python-packages = (pkgs.python3.withPackages (ps: [ ps.jupyterlab
                                                       ])).override (args: { ignoreCollisions = true;});

  my-system = pkgs.buildEnv {
  name = "my-system";
  paths = with pkgs; [ pet postgresql
                       ( texlive.combine # latex + packages
                         { inherit (texlive)
                           collection-plaingeneric
                           collection-latexextra
                           collection-fontsrecommended
                           collection-pictures
                           collection-bibtexextra
                           collection-mathscience
                           collection-langgerman
                           scheme-basic
                           xetex
                           cjk
                           ctex
                           xecjk
                           fontspec euenc;
                         }
                       )
                       emacs
                       ispell
                       texlive.combined.scheme-basic
                       jupyter
                       lxappearance
                       appimage-run
                       glxinfo
                       w3m
                       polybar
                       cmake
                       home-manager
                       gnumake
                       conda
                       qt5.full
                       qtcreator
                       git
                       wget
                       curl
                       gnupg
                       openssl
                       killall
                       # Browser
                       chromium
                       tor-browser-bundle-bin
                       #firefox-bin
                       # book

                       xdotool
                       okular
                       #password
                       enpass

                       # graph
                       ditaa
                       graphviz
                       #terminal
                       kitty
                       # Unzip
                       p7zip
                       unzip
                       zip
                       pciutils    # lspci
                       psmisc      # pkill, killall, pstree, fuser
                       # rime
                       librime
                       fcitx-configtool
                       #
                       goldendict
                       #
                       qt5.qtbase
                       #xdgrm
                       virtmanager
                       nixops
                       nix-index
                       cargo
                       rustup
                       rustc
                       chez
                       guile
                       racket
                       gcc9
                       #lang-haskell
                       cabal2nix # create nix expressions for haskell projects from cabal file
                       #lang-c++
                       llvmPackages.libclang
                       clang
                       (ccls.overrideDerivation (oldAttrs: {
                         src = fetchFromGitHub{
                           owner = "MaskRay";
                           repo = "ccls";
                           rev = "bd609e89a29c508c8c763db2ecfad50e207391b3";
                           sha256 = "18ik5rzzbwn43dd0ri518i5vzsa5ix81fpcv7gd1s6zdv3nf9bl0";
                         };
                       }))
                       julia_13
                       #lang-go
                       go
                       gotools
                       go_bootstrap
                       go-langserver
                       gocode
                       go-outline
                       go-symbols
                       go2nix
                       go-tools
                       gocode-gomod
                       godef
                       gopkgs
                       delve
                       golint

                       #remote
                       rxvt_unicode.terminfo

                       ncurses.dev # infocmp/tic/etc

                       #screenhot
                       spectacle
                       #flameshot
                       mpv
                       rocksdb
                       #
                       dotnet-sdk
                       #libraries
                       caf
                     ];
  };
}
