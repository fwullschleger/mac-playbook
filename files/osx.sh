#!/usr/bin/env bash

# Mac OS X configuration
#
# This configuration applies to the latest version of macOS (currently Sequoia 15.1),
# and sets up preferences and configurations for all the built-in services and
# apps. Third-party app config should be done elsewhere.
#
# If you want to figure out what default needs changing, do the following:
#
#   1. `cd /tmp`
#   2. Store current defaults in file: `defaults read > before`
#   3. Make a change to your system.
#   4. Store new defaults in file: `defaults read > after`
#   5. Diff the files: `diff before after`
#
# @see: http://secrets.blacktree.com/?showapp=com.apple.finder
# @see: https://github.com/herrbischoff/awesome-macos-command-line

# Warn that some commands will not be run if the script is not run as root.
if [[ $EUID -ne 0 ]]; then
  RUN_AS_ROOT=false
  printf "Certain commands will not be run without sudo privileges. To run as root, run the same command prepended with 'sudo', for example: $ sudo $0\n\n" | fold -s -w 80
else
  RUN_AS_ROOT=true
  # Update existing `sudo` timestamp until `.osx` has finished
  while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &
fi

###############################################################################
# Aerospace Window Manager Performance tweaks
###############################################################################
# @see: https://nikitabobko.github.io/AeroSpace/guide#a-note-on-displays-have-separate-spaces
# @see: https://nikitabobko.github.io/AeroSpace/guide#a-note-on-mission-control

defaults write com.apple.spaces spans-displays -bool true
defaults write com.apple.dock expose-group-apps -bool true

printf "Please log out and log back in to make all settings take effect.\n"