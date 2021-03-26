#!/bin/sh

EMACSDIR=Emacs
JOBS=4

if test ! -e /opt/local/bin/autoconf; then
    echo "sudo port install autoconf"
    exit 0
fi

export PATH=/opt/local/bin:/usr/bin:/bin:/usr/sbin:/sbin

git clone --depth 1 https://git.savannah.gnu.org/git/emacs.git /tmp/$EMACSDIR

cd /tmp/$EMACSDIR
sh autogen.sh

mkdir build
cd build
../configure --with-ns --without-makeinfo --with-gnutls=no

make -j $JOBS || (echo "falure exit" ; exit)
make install

open /tmp/$EMACSDIR/build/nextstep

exit 0






