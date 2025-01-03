import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.SpawnOnce
import XMonad.Util.EZConfig(additionalKeys)
import System.IO

main = do   
    xmproc <- spawnPipe "xmobar -x 1"
    spawn "xrandr --output HDMI-1 --auto --primary --output eDP-1 --auto --left-of HDMI-1 &" --dual monitor config
    spawn "xrandr --output HDMI-1-1 --auto --primary --output eDP-1-1 --auto --left-of HDMI-1-1 &" --dual monitor config

    let wallpaper_path = "/home/emre/Pictures/SHORPY-52nd-street-1.jpg" -- SHORPY-mount-vernon-colorado.jpg"
    spawn $ "xloadimage -onroot -at 0,-200 " ++wallpaper_path++ " -at 1920,-200 " ++wallpaper_path++ " &" --set wallpaper, note that the '$' is necessary for string concatenation

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
            , ((mod1Mask, xK_p), spawn "playerctl play-pause")
            , ((mod4Mask, xK_n), spawn "nemo")
            , ((mod4Mask, xK_i), spawn "cinnamon-settings")
            , ((mod4Mask, xK_o), spawn "opera")
            , ((mod1Mask, xK_3), spawn "gnome-screenshot -a")
            , ((mod1Mask .|. controlMask, xK_3), spawn "gnome-screenshot")
            , ((0, 0x1008FF14), spawn "playerctl play-pause")
            , ((0, 0x1008FF16), spawn "playerctl previous")
            , ((0, 0x1008FF17), spawn "playerctl next")
            , ((controlMask .|. mod4Mask, xK_s), spawn "systemctl suspend")
            , ((controlMask .|. mod4Mask .|. mod1Mask, xK_equal), spawn "shutdown now")
            , ((mod1Mask, xK_bracketleft), spawn "playerctl previous")
            , ((mod1Mask, xK_bracketright), spawn "playerctl next")
            , ((mod4Mask .|. shiftMask, xK_t), spawn "setxkbmap tr")
            , ((mod4Mask .|. shiftMask, xK_u), spawn "setxkbmap us")
            ]
