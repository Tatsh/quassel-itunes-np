ObjC.import 'stdio'
ObjC.import 'stdlib'
ObjC.import 'AppKit'
ObjC.import 'Foundation'
NSUTF8StringEncoding = 4

running = false

# Check if iTunes is running
for app in ObjC.unwrap($.NSWorkspace.sharedWorkspace.runningApplications)
    # alternative is to unwrap, and this first check is unneccesary:
    # if ObjC.unwrap(app.bundleIdentifier) == 'com.apple.iTunes'
    if typeof app.bundleIdentifier.isEqualToString is 'undefined'
        continue
    if app.bundleIdentifier.isEqualToString 'com.apple.iTunes'
        running = true
        break

if not running
    $.exit 1

itunes = Application 'iTunes'

try
    currentTrack = itunes.currentTrack()
catch
    # No track playing
    $.exit 0

# use $.printf because that doesn't give an extra new line, unlike console.log
$.printf "/me is listening to #{ currentTrack.artist() } - #{ currentTrack.name() } (via iTunes)"
