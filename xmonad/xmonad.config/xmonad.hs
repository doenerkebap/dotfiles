import XMonad
import XMonad.Config.Desktop
import XMonad.Layout.TwoPane
import XMonad.Layout.ResizableTile
import qualified Data.Map as M
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.DynamicLog (xmobar)
import Graphics.X11.ExtraTypes.XF86
-- import XMonad.Hooks.DynamicLog
-- import XMonad.Util.Run(spawnPipe)
-- import System.IO

main = do
    xmonad =<< xmobar desktopConfig
        { terminal = myTerminal
	, keys = myKeys <+> keys desktopConfig
        , manageHook = manageDocks <+> manageHook desktopConfig
	, layoutHook = avoidStruts $ myLayoutHook
        }

myTerminal = "termite -d $(cat $XDG_CACHE_HOME/last_dir)"
myKeys conf@(XConfig {XMonad.modMask = modm}) = M.fromList
    [ ((modm, xK_u), sendMessage MirrorShrink)
    , ((modm, xK_i), sendMessage MirrorExpand)
    , ((modm, xK_p), spawn "$ZSH/dmenu/dmenu_run-dark")
    , ((0, xF86XK_AudioLowerVolume), spawn "amixer set Master 2-")
    , ((0, xF86XK_AudioRaiseVolume), spawn "amixer set Master 2+")
    , ((0, xF86XK_AudioMute), spawn "amixer set Master toggle")
    , ((0, xF86XK_MonBrightnessUp), spawn "xbacklight -inc 4")
    , ((0, xF86XK_MonBrightnessDown), spawn "xbacklight -dec 4")
    ]
myLayoutHook = Full ||| ResizableTall 1 (2/100) (1/2) [] ||| TwoPane (2/100) (1/2) ||| Mirror (ResizableTall 1 (2/100) (1/2) [])

