from libqtile import bar, qtile, lazy

from qtile_extras import widget
from qtile_extras.widget.decorations import RectDecoration

from utils.settings import *

import os

home = os.path.expanduser('~')

# Default Settings for the Groups
group_box_settings = {
    "active": cyan,
    "block_highlight_text_color": cyan,
    "this_current_screen_border": fg,
    "this_screen_border": yellow,
    "urgent_border": fg,
    "background": bg, 
    "other_current_screen_border": bg,
    "other_screen_border": bg,
    "highlight_color": grey,
    "inactive": grey,
    "foreground": fg,
    "borderwidth": 2,
    "disable_drag": True,
    "fontsize": 13,
    "highlight_method": "line",
    "padding_x": 10,
    "padding_y": 16,
    "rounded": False,
}

def open_launcher():
    qtile.cmd_spawn('rofi -show drun')

#def open_power():
#    lazy.spawn([home + '/.config/rofi/powermenu/powermenu.sh'])

def toggle_maximize():
    lazy.window.toggle_maximize()

# Simplifies Certain Window Names
def parse_window_name(text):
    target_names = [
        "Mozilla Firefox",
        "Visual Studio Code",
        "Discord",
        "Sublime Text",
    ]
    return next(filter(lambda name: name in text, target_names), text)


def separator_sm():
    return widget.Sep(
        foreground=bg,
        padding=1,
        linewidth=1,
        size_percent=55,
    )

def separator():
    return widget.Sep(
        foreground=colors[0],
        padding=4,
        linewidth=3,
    )

#Default Widget Decoration
base_decor = {
    "color": bg,
    "filled": True,
    "padding_y": 4,
    "line_width": 0,
	}

# Used for Icons
def icon_decor(color):
    return [
        RectDecoration(
            colour=color,
            radius=4,
            filled=True,
            padding_x=None,
            padding_y=4,
        )
    ]

# Used for Text
def text_decor():
    return [
        RectDecoration(
            colour=grey,
            radius=4,
            filled=True,
            padding_y=4,
            padding_x=0,
        )
    ]

# Menu Icon
launcher_icon = widget.Image(
    background=cyan,
    margin_x=14,
    margin_y=3,
    filename="~/.config/qtile/icons/homestuck.png",
    mouse_callbacks={'Button1': open_launcher},
)

# Window Groups
w_groupbox = (
    widget.GroupBox(
        font="Dina TTF",
        visible_groups=workspace_names,
        **group_box_settings,
    ),
)

#Middle Window Name
w_window_name = (
    widget.Spacer(),
    widget.TextBox(
        text="",
        foreground=fg,
        font="Font Awesome 6 Free Solid",
	),
    separator(),
    widget.WindowName(
        foreground=fg,
        width=bar.CALCULATED,
        empty_group_string="Desktop",
        max_chars=40,
        parse_text=parse_window_name,
        mouse_callbacks={"Button1": toggle_maximize},
	),
    widget.Spacer(),
)

w_temperature = (
    widget.TextBox(
        text="",
        foreground=bg,
        font="Font Awesome 6 Free Solid",
        fontsize=15,
        padding=8,
        decorations=icon_decor(lightred),
    ),
    separator_sm(),
    widget.ThermalSensor(
        foreground=fg,
        padding=8,
        decorations=text_decor(),
    ),
    separator(),
)

# Layout Indicator
w_current_layout = (
    widget.TextBox(
        text="",
        foreground=bg,
        font="Font Awesome 6 Free Solid",
        fontsize=15,
        padding=8,
        decorations=icon_decor(lightcyan),
    ),
    separator_sm(),
    widget.CurrentLayout(
        foreground=fg,
        padding=8,
        decorations=text_decor(),
    ),
    separator(),
)

# Volume Indicator
w_volume = (
    widget.TextBox(
        text="",
        foreground=bg,
        font="Font Awesome 6 Free Solid",
        fontsize=15,
        padding=8,
        decorations=icon_decor(lightgreen),
    ),
    separator_sm(),
    widget.PulseVolume(
        foreground=fg,
        imit_max_volume="True",
        padding=8,
        decorations=text_decor(),
    ),
    separator(),
)

# Battery
w_battery = (
    (
        widget.Battery(
            format='{char}',
            charge_char='',
            discharge_char='',
            full_char='',
            unknown_char='',
            empty_char='',
            foreground=bg,
            fontsize=15,
            padding=8,
            decorations=icon_decor(lightyellow),
            update_interval=5,
        ),
        separator_sm(),
        widget.Battery(
            format='{percent:2.0%}',
            foreground=fg,
            padding=8,
            decorations=text_decor(),
        ),
        separator(),
    )
    if battery
    else ()
)

# Calendar
w_clock = (
    widget.TextBox(
        text="",
        font="JetBrainsMono Nerd Font",
        fontsize=16,
        foreground=bg,
        padding=8,
        decorations=icon_decor(lightblue),
    ),
    separator_sm(),
    widget.Clock(
        format="%b %d, %H:%M",
        foreground=fg,
        padding=8,
        decorations=text_decor(),
    ),
    separator(),
)

# Power Menu
w_power = widget.TextBox(
    text="⏻",
    background=lightpurple,
    foreground=bg,
    font="Font Awesome 6 Free Solid",
    fontsize=18,
    padding=16,
)

# Updates
w_updates = (
    widget.TextBox(
        text = "",
        font="JetBrainsMono Nerd Font",
        fontsize=16,
        foreground=bg,
        padding=8,
        decorations=icon_decor(blue),
    ),
    separator_sm(),
    widget.CheckUpdates(
        foreground=fg,
        padding=8,
        decorations=text_decor(),
    ),
    separator(),
)

# WLAN
