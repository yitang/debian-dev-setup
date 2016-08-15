#!/bin/sh
#
# This script is to set up the APT source list for Debian so that user
# can install packages from Secutity, Stable, Testing, and Unstable
# repositry with priority in such order.
#
# To choose a package from testing, user `sudo apt-get install
# packageName/testing`

# This script is for experienced user only. By default, the whole
# script is commented out.
# http://serverfault.com/questions/22414/how-can-i-run-debian-stable-but-install-some-packages-from-testing 

sudo -k


if [ ! -f /etc/apt/preferences.d/security.pref ]; then
    echo "-------------------------"
    echo "Adding Security repo"
    echo 'Package: *
Pin: release l=Debian-Security
Pin-Priority: 1000' > /etc/apt/preferences.d/security.pref

    echo 'deb     http://security.debian.org/         stable/updates  main contrib non-free
deb     http://security.debian.org/         testing/updates main contrib non-free' > /etc/apt/sources.list.d/security.list
    
fi


if [ ! -f /etc/apt/preferences.d/stable.pref ]; then
    echo "-------------------------"
    echo "Adding Stable repo"
    echo 'Package: *
Pin: release a=stable
Pin-Priority: 900' > /etc/apt/preferences.d/stable.pref

    echo 'deb     http://mirror.steadfast.net/debian/ stable main contrib non-free
deb-src http://mirror.steadfast.net/debian/ stable main contrib non-free
deb     http://ftp.us.debian.org/debian/    stable main contrib non-free
deb-src http://ftp.us.debian.org/debian/    stable main contrib non-free' > /etc/apt/sources.list.d/stable.list
    
fi


if [ ! -f /etc/apt/preferences.d/testing.pref ]; then
    echo "-------------------------"
    echo "Adding Testing repo"
    echo 'Package: *
Pin: release a=testing
Pin-Priority: 750' > /etc/apt/preferences.d/testing.pref

    echo 'deb     http://mirror.steadfast.net/debian/ testing main contrib non-free
deb-src http://mirror.steadfast.net/debian/ testing main contrib non-free
deb     http://ftp.us.debian.org/debian/    testing main contrib non-free
deb-src http://ftp.us.debian.org/debian/    testing main contrib non-free' > /etc/apt/sources.list.d/testing.list
    
fi


if [ ! -f /etc/apt/preferences.d/unstable.pref ]; then
    echo "-------------------------"
    echo "Adding Unstable repo"
    echo 'Package: *
Pin: release a=unstable
Pin-Priority: 50' > /etc/apt/preferences.d/unstable.pref

    echo 'deb     http://mirror.steadfast.net/debian/ sid main contrib non-free
deb-src http://mirror.steadfast.net/debian/ sid main contrib non-free
deb     http://ftp.us.debian.org/debian/    sid main contrib non-free
deb-src http://ftp.us.debian.org/debian/    sid main contrib non-free' > /etc/apt/sources.list.d/unstable.list
    
fi

sudo apt-get update
