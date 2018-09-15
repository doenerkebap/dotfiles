import XMonad
import XMonad.Config.Desktop
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run(spawnPipe)
import XMonad.Hooks.DynamicLog (xmobar)
import System.IO

main = do
    xmonad =<< xmobar desktopConfig
        { terminal = "termite -d $(cat $XDG_CACHE_HOME/last_dir)"
        , manageHook = manageDocks <+> manageHook desktopConfig
        , layoutHook = avoidStruts  $  layoutHook desktopConfig
        }
