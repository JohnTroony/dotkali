#!/bin/bash

if [ -d fontconfig-infinality-0 ]; then
  rm -rvf fontconfig-infinality-0
fi

mkdir fontconfig-infinality-0
cd fontconfig-infinality-0

tar xzf ../fontconfig-infinality-1-20130104_0.tar.gz

cp -rv ../debian/ .

debuild -us -uc -b
