#!/bin/bash
vers=(${kernelver//./ })    #split kernel version into individual elements
vers="${vers[0]}.${vers[1]}"    #recombine as needed
echo "Extracting ${kernelver} original source ${vers}"
tar -xf /usr/src/linux-source-$vers.tar.xz linux-source-$vers/$1 --xform=s,linux-source-$vers/$1,.,
for i in ${@:2}
do
  echo "Applying $i"
  patch < $i
done
