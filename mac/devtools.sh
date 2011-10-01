#!/bin/sh

echo
echo "  → Removing DeveloperTools and installing GCC..."
sudo /Developer/Library/uninstall-devtools –mode=all
curl --progress-bar --insecure --location --output /tmp/GCC-10.7-v2.pkg https://github.com/downloads/kennethreitz/osx-gcc-installer/GCC-10.7-v2.pkg
open /tmp/GCC-10.7-v2.pkg

echo "✓ Install GCC with via the graphical installer"
