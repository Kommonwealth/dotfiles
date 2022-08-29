from libqtile.config import Key
from libqtile.lazy import lazy

import os
import subprocess

mod = "mod4"
control = "control"
shift = "shift"
alt = "mod1"
terminal = "alacritty"
browser = "firefox"

home = os.path.expanduser('~')

keys = [
    # Spawn Programs
    Key([mod], "Return", lazy.spawn(terminal), desc="Launch terminal"),
    Key([mod], "b", lazy.spawn(browser), desc="Launch browser"),
    Key([mod], "s", lazy.spawn("subl"), desc="Launch sublime"),
    Key([mod], "t", lazy.spawn("thunar"), desc="Launch thunar"),
    Key([mod], "w", lazy.window.kill(), desc="Kill focused window"),

    #Qtiles
    Key([mod, "control"], "r", lazy.reload_config(), desc="Reload Qtile"),
    Key([mod, "control"], "q", lazy.shutdown(), desc="Shutdown Qtile"),

    # Layouts
    Key([mod], "Tab", lazy.next_layout(), desc="Toggle between layouts"),

    #Control Volume
    Key([mod], "g", lazy.spawn("amixer set Master 5%-"), desc='Decrease volume by 5%'),
    Key([mod], "h", lazy.spawn("amixer set Master 5%+"), desc='Increase volume by 5%'),

    # Switch Between Windows
    Key([mod], "h", lazy.layout.left(), desc="Move focus to left"),
    Key([mod], "l", lazy.layout.right(), desc="Move focus to right"),
    Key([mod], "j", lazy.layout.down(), desc="Move focus down"),
    Key([mod], "k", lazy.layout.up(), desc="Move focus up"),
    Key([mod], "space", lazy.layout.next(), desc="Move window focus to other window"),

    # Move Windows
    Key([mod, "shift"], "h", lazy.layout.shuffle_left(), desc="Move window to the left"),
    Key([mod, "shift"], "l", lazy.layout.shuffle_right(), desc="Move window to the right"),
    Key([mod, "shift"], "j", lazy.layout.shuffle_down(), desc="Move window down"),
    Key([mod, "shift"], "k", lazy.layout.shuffle_up(), desc="Move window up"),
    Key([mod], "w", lazy.window.kill(), desc="Kill focused window"),

    # Grow Windows
    Key([mod, "control"], "h", lazy.layout.grow_left(), desc="Grow window to the left"),
    Key([mod, "control"], "l", lazy.layout.grow_right(), desc="Grow window to the right"),
    Key([mod, "control"], "j", lazy.layout.grow_down(), desc="Grow window down"),
    Key([mod, "control"], "k", lazy.layout.grow_up(), desc="Grow window up"),
    Key([mod, alt], "n", lazy.layout.normalize(), desc="Normalize window size ratios"),

    #Screenshots
    Key([], "Print", lazy.spawn("" + home + "/.local/bin/prtscreen"), desc="Print Screen"),
    Key([mod], "Print", lazy.spawn("" + home + "/.local/bin/prtscreenregion"), desc="Print region of screen"),
]