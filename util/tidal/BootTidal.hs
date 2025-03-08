:set -fno-warn-orphans
:set -XMultiParamTypeClasses
:set -XOverloadedStrings
:set prompt ""

-- Import all the boot functions and aliases.
import Sound.Tidal.Boot

default (Pattern String, Integer, Double)

-- ES8 48khz bei 128 Buffer = 0.066 latency
:{
let mTarget :: Target
    mTarget = Target 
      { oName      = "tidal"
      , oAddress   = "127.0.0.1"
      , oPort      = 9003
      , oLatency   = 0.01
      , oSchedule  = Live
      , oWindow    = Nothing
      , oHandshake = False
      , oBusPort   = Nothing
      }

    cv1 = pF "cv1"
    cv2 = pF "cv2"
    cv3 = pF "cv3"
    cv4 = pF "cv4"

    tidalShape :: OSC
    tidalShape = OSC "/tidal" $ 
      ArgList [ ("s"  , Nothing)
              , ("n"  , Just $ VS "empty")
              , ("cv1", Just $ VF 0) 
              , ("cv2", Just $ VF 0) 
              , ("cv3", Just $ VF 0) 
              , ("cv4", Just $ VF 0) 
              ]

    mOsc :: OscMap
    mOsc = [(mTarget, [tidalShape])]

    -- turing machine, outside value as steps, <~ shifts in time
    turing steps len shift = outside steps (repeatCycles len) $ shift <~ irand 127

    -- blofeld = "blofeld"

    -- mininotation microtonality:
    edo n = 1200/n
:}

-- Create a Tidal Stream 
tidalInst <- mkTidalWith mOsc defaultConfig

instance Tidally where tidal = tidalInst

enableLink

:set -fwarn-orphans
:set prompt "tidal> "
:set prompt-cont ""
