#!/bin/bash

tar xvzf apr-1.4.4.tar.gz
tar xvzf apr-util-1.4.1.tar.gz

cd apr-1.4.4
./configure
make
make install

cd ..
cd apr-util-1.4.1
./configure --with-apr=/usr/local/apr
make
make install

