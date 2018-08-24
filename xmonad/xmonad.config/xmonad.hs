import XMonad
import XMonad.Config.Desktop
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run(spawnPipe)
import System.IO

main = do
    xmproc <- spawnPipe "xmobar"

    xmonad $ desktopConfig
        { terminal = "termite"
        , manageHook = manageDocks <+> manageHook desktopConfig
        , layoutHook = avoidStruts  $  layoutHook desktopConfig
        , logHook = dynamicLogWithPP xmobarPP
                { ppOutput = hPutStrLn xmproc
                , ppTitle = xmobarColor "green" "" . shorten 50
                }
        }
