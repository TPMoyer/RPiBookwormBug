# RPiBookwormBug
Processing 4 sketch which fails on RPi bookworm, works on RPi buster and Bunsenlabs Boron

This has been understood to have been an effect of Debian Bookworm using Wayland instead of X11.
The failure point was the java.robot class, which uses low level access to the IO.
No date has been posted for an expectation of robot <==> Wayland compatibllity.
