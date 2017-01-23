#!/bin/bash

sudo apt-get install -y build-essential git libtool nodejs npm nodejs-legacy jpegoptim 
sudo apt-get install -y advancecomp gifiscle imagemagick m4 automake lzma lzma-dev
sudo apt-get install -y liblzma-dev pkg-config libmagic-dev zlib1g-dev libgumbo-dev
sudo apt-get install -y icu-devtools libicu-dev tcl screen

sudo apt-get install -y git cmake meson python3-virtualenv virtualenvwrapper aria2 libtool
sudo apt-get install -y libxapian-dev libpng-dev m4

git clone https://gerrit.wikimedia.org/r/p/openzim.git
cd openzim/zimlib/
./autogen.sh ./configure make ldconfig
cd ../zimwriterfs
./autogen.sh
./configure CXXFLAGS=-I../zimlib/include LDFLAGS=-L../zimlib/src/.libs
Make
# Later ran make install for both zimlib and zimwriterfs then ldconfig
cd ../..
git clone https://github.com/kiwix/mwoffliner
cd kiwix
npm install
wget http://download.redis.io/redis-stable.tar.gz
cd redis-stable
make
# make test - OK
#  Need to build latest pngquant
# apt-get install libpng-dev
git clone https://github.com/pornel/pngquant.git --depth 1
./configure
Make
Make install

