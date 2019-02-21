#!/bin/bash

set -v

OPTIONS="--enable-optimization=2 -j4"
COMMAND="cabal v2-install $OPTIONS"


function ghc-pkg-reset() {
    read -p 'erasing all your user ghc and cabal packages - are you sure (y/n) ? ' ans
    test x$ans == xy && ( \
        echo 'erasing directories under ~/.ghc'; rm -rf `find ~/.ghc -maxdepth 1 -type d`; \
        echo 'erasing ~/.cabal/lib'; rm -rf ~/.cabal/lib; \
        echo 'erasing ~/.cabal/packages'; rm -rf ~/.cabal/packages; \
        echo 'erasing ~/.cabal/share'; rm -rf ~/.cabal/share; \
        )
}

ghc-pkg-reset

cabal v2-update

$COMMAND --lib Cabal
$COMMAND alex
$COMMAND brittany
$COMMAND criterion
$COMMAND happy
$COMMAND haskell-ci
$COMMAND hfmt
$COMMAND hindent
$COMMAND hlint
$COMMAND apply-refact
$COMMAND stylish-haskell
