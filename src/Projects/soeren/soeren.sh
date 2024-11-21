#! /bin/bash

# JACK
# pkill -9 jackd &&
# sleep 1

# jackd -dalsa -dhw:ES8 -r48000 -p256 &
# jackd -dalsa -dhw:PCH -r48000 -p512 &
# jackd -dalsa -dhw:Babyface2345400 -r48000 -p512 &

# jack_lsp, etc.
# https://github.com/jackaudio/jack-example-tools

sleep 3

# supercollider, pd and tidal:
# scide ~/soeren/soeren.scd &
# pd -rt -open ~/repositories/pdfiles/src/Projects/soerenliveDIRECT.pd &
st -f "Terminus:pixelsize=18:antialias=true:autohint=true" -e vim ~/repositories/soeren/soeren.tidal -c TidalSend -c "wincmd H"

