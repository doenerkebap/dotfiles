import XMonad
import XMonad.Config.Desktop
import XMonad.Layout.TwoPane
import XMonad.Layout.ResizableTile
import qualified Data.Map as M
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.DynamicLog (xmobar)
import Graphics.X11.ExtraTypes.XF86
import XMonad.Hooks.DynamicLog
import XMonad.Util.Run(spawnPipe)
import System.IO

main = do
    xmonad =<< xmobar desktopConfig
        { terminal = myTerminal
	, keys = myKeys <+> keys desktopConfig
        , manageHook = manageDocks <+> manageHook desktopConfig
	, layoutHook = avoidStruts $ myLayoutHook
        , normalBorderColor = solarizedBase01
        , focusedBorderColor = solarizedRed
        }

myTerminal = "termite -d $(cat $XDG_CACHE_HOME/last_dir)"
myKeys conf@(XConfig {XMonad.modMask = modm}) = M.fromList
    [ ((modm, xK_u), sendMessage MirrorShrink)
    , ((modm, xK_i), sendMessage MirrorExpand)
    , ((modm, xK_p), spawn "$ZSH/dmenu/menu")
    , ((0, xF86XK_AudioLowerVolume), spawn "amixer set Master 2-")
    , ((0, xF86XK_AudioRaiseVolume), spawn "amixer set Master 2+")
    , ((0, xF86XK_AudioMute), spawn "amixer set Master toggle")
    , ((0, xF86XK_MonBrightnessUp), spawn "xbacklight -inc 4")
    , ((0, xF86XK_MonBrightnessDown), spawn "xbacklight -dec 4")
    ]
myLayoutHook = Full ||| ResizableTall 1 (2/100) (1/2) [] ||| TwoPane (2/100) (1/2) ||| Mirror (ResizableTall 1 (2/100) (1/2) [])

solarizedBase03  = "#002b36"
solarizedBase02  = "#073642"
solarizedBase01  = "#586e75"
solarizedBase00  = "#657b83"
solarizedBase0   = "#839496"
solarizedBase1   = "#93a1a1"
solarizedBase2   = "#eee8d5"
solarizedBase3   = "#fdf6e3"
solarizedYellow  = "#b58900"
solarizedOrange  = "#cb4b16"
solarizedRed     = "#dc322f"
solarizedMagenta = "#d33682"
solarizedViolet  = "#6c71c4"
solarizedBlue    = "#268bd2"
solarizedCyan    = "#2aa198"
solarizedGreen = "#859900"
