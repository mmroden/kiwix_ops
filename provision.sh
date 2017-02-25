#!/bin/bash

whoami
apt-get install -y build-essential git libtool nodejs npm nodejs-legacy jpegoptim
apt-get install -y advancecomp gifsicle imagemagick m4 automake lzma lzma-dev
apt-get install -y liblzma-dev pkg-config libmagic-dev zlib1g-dev libgumbo-dev
apt-get install -y icu-devtools libicu-dev tcl screen

apt-get install -y git cmake meson python3-virtualenv virtualenvwrapper aria2 libtool
apt-get install -y libpng-dev m4
add-apt-repository ppa:xapian-backports/ppa

apt update
apt install -y libxapian-dev

git clone https://gerrit.wikimedia.org/r/p/openzim.git
cd openzim/zimlib/
./autogen.sh
 ./configure
make
make install
ldconfig
cd ../zimwriterfs
./autogen.sh
./configure CXXFLAGS=-I../zimlib/include LDFLAGS=-L../zimlib/src/.libs
make
make install
ldconfig
cd ../..
git clone https://github.com/kiwix/mwoffliner
cd mwoffliner
npm install
cd ..
wget http://download.redis.io/redis-stable.tar.gz
tar xvf redis-stable.tar.gz
cd redis-stable
make
make install

# make test - OK
# configure redis
sed -i 's?# unixsocket /tmp/redis.sock?unixsocket /dev/shm/redis.sock?' redis.conf
sed -i 's?# unixsocketperm 700?unixsocketperm 700?' redis.conf

#  Need to build latest pngquant
# apt-get install libpng-dev
cd ..
git clone https://github.com/pornel/pngquant.git --depth 1
cd pngquant
./configure
make
make install
cd ..

echo 'ready to start redis and mwoffliner'
redis-server redis-stable/redis.conf


