#!/bin/sh

# TODO: This package is obsolete, see <http://kennethreitz.com/xcode-gcc-and-homebrew.html>
#       Download from <https://developer.apple.com/downloads/download.action?path=Developer_Tools/command_line_tools_for_xcode__march_2012/command_line_tools_for_xcode.dmg>

echo
echo "  → Removing DeveloperTools and installing GCC..."
sudo /Developer/Library/uninstall-devtools –mode=all
curl --progress-bar --insecure --location --output /tmp/GCC-10.7-v2.pkg https://github.com/downloads/kennethreitz/osx-gcc-installer/GCC-10.7-v2.pkg
open /tmp/GCC-10.7-v2.pkg

echo "✓ Install GCC with via the graphical installer"
