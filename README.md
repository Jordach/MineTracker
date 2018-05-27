# MineTracker
MineTracker GUI and Love2D based player.

Requires Löve2D, Lua 5.1, Python3.

# Using the MineTracker:

Adding new samples to your track? Make sure they're uniquely named, otherwise, name collisions will occur.

The suggested naming convention is: ```instrument_authour_track_bpm.ogg```

An example would be ```kick_jordach_test_135.ogg```

todo

Using the preview button will launch the Love2D player alongside exporting the track as playback.mtr.

# Using the LovePlayer:

The LovePlayer has two keys:

```Space```, to restart playing of the track.

```Escape```, to exit the preview script.

You can also use ```Command + Q``` on macOS, ```Alt + F4``` on all versions of Windows, and whatever sends the ```SIGKILL``` on Linux systems.

Note: LovePlayer can be launched separately.

The primary GUI in Python will usefully export previews of your track into ```/loveplayer/playback.mtr

Please note that the player will only look for a single file.

# Potential Launching Issues:

```launch-player-mac-global.sh``` is used for those with macOS or Mac OS X installs where Love2D is installed globally.

```launch-player-mac.sh``` is used with a portable version, which will be bundled with releases. It will not be contained within this repo.

If Love2D is not working, try ```chmod 0777 launch-player-mac.sh``` is ran first while inside this directory. If ```launch-player-mac-global.sh``` fails to launch, use the previous ```chmod``` command, and use ```launch-player-mac-global.sh``` in place of ```launch-player-mac.sh```.

Linux users, just open a terminal wherever inside this folder, and type ```love /loveplayer```.