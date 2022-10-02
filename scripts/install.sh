#!/bin/bash
#
# File: ./scripts/install.sh
#
# Note:
# chmod a+x = Change access permissions of this file, to 'e[x]ecutable' for '[a]ll users'
#
# Example:
# ---
# chmod a+x scripts/*sh
# ---

# e: exit the script if any statement returns a non-true return value
# v: print shell input lines as they are read (including all comments!)
set -e

# $1 = live_version

# install project files
cd $INIT_CWD \
&& echo "Installing configuration files" \
&& cp 'ni-kontrol-z1/ni-controller-editor/Kontrol_Z1_TL3.nckz1' ~/Documents/Native\ Instruments/Controller\ Editor/ \
&& cp 'ni-maschine-mk1/ni-controller-editor/Maschine_Mk1_TL3.ncm' ~/Documents/Native\ Instruments/Controller\ Editor/ \
&& cp -R 'ni-kontrol-z1/user-remote-scripts/Kontrol_Z1_TL3' ~/Library/Preferences/Ableton/Live\ $1/User\ Remote\ Scripts/ \
&& cp -R 'ni-maschine-mk1/user-remote-scripts/Maschine_Mk1_TL3' ~/Library/Preferences/Ableton/Live\ $1/User\ Remote\ Scripts/ \
&& cp -R 'traktor-pro/max4live/Traktor\ Pro\ 3\ Control.amxd' ~/Music/Ableton/User\ Library/Presets/MIDI\ Effects/Max\ MIDI\ Effect/ \ 
&& cp 'loopback/Devices.plist' ~/Library/Application\ Support/Loopback \
&& echo "Installation complete"
