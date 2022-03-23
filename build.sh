#!/bin/bash

git clone --recursive https://github.com/LINBIT/drbd/

cd drbd/
git checkout "$VERSION"

sudo apt update
sudo apt install -y devscripts linux-headers-"$(uname -r)" coccinelle

make -j && make clean  # https://lists.archive.carbon60.com/drbd/users/27272

debuild -i -us -uc -b
