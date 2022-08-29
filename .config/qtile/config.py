from libqtile import bar, layout, widget
from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile.lazy import lazy

from modules.keys import mod, keys, shift
from modules.groups import groups
from modules.mouse import mouse
from modules.layouts import layouts, floating_layout
from utils.settings import colors, workspace_names
from modules.widgets import *
from modules.screens import widget_defaults, screens, main_screen_bar
from utils.settings import colors, wallpaper_main, wallpaper_sec, two_monitors
import os

# Importing Widgets Without Calling Them Allows Them to Still Function

dgroups_key_binder = None
dgroups_app_rules = []  # type: list
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False
auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True
auto_minimize = True
wl_input_rules = None
wmname = "qtile"
