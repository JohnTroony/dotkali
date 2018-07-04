#!/bin/bash

if [ -d fontconfig-infinality-0 ]; then
  rm -rvf fontconfig-infinality-0
fi

mkdir fontconfig-infinality-0
cd fontconfig-infinality-0

tar xJvf ../fontconfig-infinality-20130104.tar.xz

cp -rv ../debian/ .

debuild -us -uc -b
