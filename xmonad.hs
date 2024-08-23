import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import System.IO

main = do   
    xmproc <- spawnPipe "xmobar"
    xmonad $ docks def
        { layoutHook = avoidStruts  $  layoutHook def
        , logHook = dynamicLogWithPP xmobarPP
                        { ppOutput = hPutStrLn xmproc
                        , ppTitle = xmobarColor "green" "" . shorten 50
                        }
        , modMask = mod4Mask     -- Rebind Mod to the Windows key
        }  `additionalKeys`
            [ ((0, 0x1008FF11), spawn "amixer -q sset -D pulse Master 10%-")
            , ((0, 0x1008FF13), spawn "amixer -q sset -D pulse Master 10%+")
            , ((shiftMask, 0x1008FF11), spawn "amixer -q sset -D pulse Master 5%-")
            , ((shiftMask, 0x1008FF13), spawn "amixer -q sset -D pulse Master 5%+")
            , ((0, 0x1008FF12), spawn "amixer -q sset -D pulse Master toggle")
            , ((0, 0x1008FF03), spawn "lux -s 10%")
            , ((0, 0x1008FF02), spawn "lux -a 10%")
            , ((shiftMask, 0x1008FF02), spawn "lux -a 5%")
            , ((shiftMask, 0x1008FF03), spawn "lux -s 5%")
            ]
