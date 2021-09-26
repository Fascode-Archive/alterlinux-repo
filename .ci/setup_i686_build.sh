#!/bin/bash

# Exit on first error
set -e

# Nothing to do for x86_64 as this is the host architecture
if [ "$REPO_MAKE_ARCH" = "x86_64" ]; then
  echo "No i686 build setup needed for x86_64, exiting..."
  exit 0
fi

# Enable i686 architecture
sudo dpkg --add-architecture i386
sudo apt-get update
sudo apt-get install crossbuild-essential-i386

# Enable a reduced repo-make.conf list. ARM build is slow so we don't build the
# full set.
rm repo-make.conf
cp repo-make-i686.conf repo-make.conf
