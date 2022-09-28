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
&& cp 'ni-controller-editor/Ableton_Resampler.ncm' ~/Documents/Native\ Instruments/Controller\ Editor/ \
&& cp 'ni-maschine-mk1/user-remote-scripts/UserConfiguration.txt' ~/Library/Preferences/Ableton/Live\ $1/User\ Remote\ Scripts/Maschine\ Mk1\ User\ Remote\ Script/ \
&& rm -rf clyphx-pro/ClyphX_Pro/XTB \
&& cp -R clyphx-pro/ClyphX_Pro/XTA clyphx-pro/ClyphX_Pro/XTB \
&& rm -rf clyphx-pro/ClyphX_Pro/XTC \
&& cp -R clyphx-pro/ClyphX_Pro/XTA clyphx-pro/ClyphX_Pro/XTC \
&& rm -rf ~/NativeKONTROL/ClyphX_Pro \
&& rm -rf '/Applications/Ableton Live 10 Standard.app/Contents/App-Resources/MIDI Remote Scripts/ClyphX_Pro/clyphx_pro/user_actions' \
&& cp -R 'clyphx-pro/ClyphX_Pro' ~/NativeKONTROL \
&& cp -R 'clyphx-pro/user_actions' /Applications/Ableton\ Live\ 10\ Standard.app/Contents/App-Resources/MIDI\ Remote\ Scripts/ClyphX_Pro/clyphx_pro \
&& cp 'loopback/Devices.plist' ~/Library/Application\ Support/Loopback \
&& echo "Installation complete"
