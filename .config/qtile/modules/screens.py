from libqtile import bar
from libqtile.config import Screen

from qtile_extras import widget

from modules.widgets import *
from utils.settings import colors, wallpaper_main, wallpaper_sec, two_monitors

# Default Widget Settings
widget_defaults = dict(
    font="JetBrainsMono Nerd Font",
    fontsize=15,
    padding=2,
    background=colors[0],
)
extension_defaults = widget_defaults.copy()

# Creates the Top Bar, Defined as a Function to Allow Multiple Monitors
def create_bar(extra_bar = False):
    return bar.Bar(
        [
       		launcher_icon,
       		*w_groupbox,
            *w_window_name,
            *w_current_layout,
            *w_temperature,
            *w_volume,
            *w_battery,
            *w_clock,
            w_power,
        ],
        30,
        margin=[4, 6, 2, 6],
    )
    
main_screen_bar = create_bar()
if two_monitors:
    secondary_screen_bar = create_bar(True)

screens = [
    Screen(
        wallpaper=wallpaper_main,
        wallpaper_mode="fill",
        top=main_screen_bar,
        bottom=bar.Gap(2),
        left=bar.Gap(2),
        right=bar.Gap(2),
    ),
]

if two_monitors:
    screens.append(
        Screen(
            wallpaper=wallpaper_sec,
            wallpaper_mode="fill",
            top=secondary_screen_bar,
            bottom=bar.Gap(2),
            left=bar.Gap(2),
            right=bar.Gap(2),
        ),
    )

