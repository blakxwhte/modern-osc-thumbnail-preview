# modern-osc-thumbnail-preview

mpv modern OSC with thumbfast thumbnail preview support. Clean install-ready package with modern.lua, thumbfast.lua, fonts, and script-opts for a smoother mpv interface, hover seekbar thumbnails, and improved playback controls.

## Included

- scripts/modern.lua
- scripts/thumbfast.lua
- fonts/Material-Design-Iconic-Font.ttf
- script-opts/thumbfast.conf

## Install

Run:
.\install.ps1

Or manually copy:

- scripts\* -> %APPDATA%\mpv\scripts\
- fonts\* -> %APPDATA%\mpv\fonts\
- script-opts\* -> %APPDATA%\mpv\script-opts\

Then make sure %APPDATA%\mpv\mpv.conf contains:

osc=no

[Idle]
profile-cond=p["idle-active"]
profile-restore=copy-equal
title=' '
keepaspect=no
background=1

## Notes

- thumbfast.lua generates thumbnails.
- modern.lua displays them in the OSC.
- Restart mpv completely after installing.
