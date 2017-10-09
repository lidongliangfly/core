#!/bin/bash

export PATH=`pwd`/depot_tools:"$PATH"

SCRIPT=$(readlink -f "$0")
SCRIPTPATH=$(dirname "$SCRIPT")

os=$(uname -s)
platform=""

case "$os" in
  Linux*)   platform="linux" ;;
  Darwin*)  platform="mac" ;; 
  *)        exit ;;
esac

architecture=$(uname -m)
arch=""

case "$architecture" in
  x86_64*)  arch="_64" ;;
  *)        arch="_32" ;;
esac

cd "$SCRIPTPATH/v8"

if [[ "$platform" == "linux" ]]
then
gn gen out.gn/linux_64 --args='is_debug=false target_cpu="x64" v8_static_library=true is_component_build=false v8_use_snapshot=false'
ninja -C out.gn/linux_64

gn gen out.gn/linux_32 --args='is_debug=false target_cpu="x86" v8_static_library=true is_component_build=false v8_use_snapshot=false'
ninja -C out.gn/linux_32
fi

if [[ "$platform" == "mac" ]]
then
gn gen out.gn/mac_64 --args='is_debug=false target_cpu="x64" v8_static_library=true is_component_build=false v8_use_snapshot=false'
ninja -C out.gn/mac_64
fi
