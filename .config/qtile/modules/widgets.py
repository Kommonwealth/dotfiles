from libqtile import bar, qtile, lazy

from qtile_extras import widget
from qtile_extras.widget.decorations import RectDecoration

from utils.settings import colors, workspace_names

import os

home = os.path.expanduser("~")

# Default Settings for the Groups
group_box_settings = {
    "active": colors[10],
    "block_highlight_text_color": colors[10],
    "this_current_screen_border": colors[10],
    "this_screen_border": colors[10],
    "urgent_border": colors[2],
    "background": colors[0], 
    "other_current_screen_border": colors[0],
    "other_screen_border": colors[0],
    "highlight_color": colors[1],
    "inactive": colors[1],
    "foreground": colors[2],
    "borderwidth": 2,
    "disable_drag": True,
    "fontsize": 14,
    "highlight_method": "line",
    "padding_x": 10,
    "padding_y": 16,
    "rounded": False,
}

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
        foreground=colors[0],
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
    "color": colors[1],
    "filled": True,
    "padding_y": 4,
    "line_width": 0,
	}

def _full_decor(color):
    return [
        RectDecoration(
            colour=color,
            radius=4,
            filled=True,
            padding_y=4,
        )
    ]

# Used for Icons
def _left_decor(color, padding_x=None, padding_y=4):
    return [
        RectDecoration(
            colour=color,
            radius=4,
            filled=True,
            padding_x=padding_x,
            padding_y=padding_y,
        )
    ]

# Used for Text
def _right_decor(color):
    return [
        RectDecoration(
            colour=colors[1],
            radius=4,
            filled=True,
            padding_y=4,
            padding_x=0,
        )
    ]

# Menu Icon
launcher_icon = widget.Image(
    background=colors[9],
    margin_x=14,
    margin_y=3,
    filename="~/.config/qtile/icons/hkskull.png",
    )

# Icons for Groups
w_groupbox_1 = widget.GroupBox(  # WEB
    font="Font Awesome 6 Brands",
    visible_groups=[workspace_names[0]],
    **group_box_settings,
    )

w_groupbox_2 = widget.GroupBox(  # DEV, SYS
    font="Font Awesome 6 Free Solid",
    visible_groups=[workspace_names[1], workspace_names[2]],
    **group_box_settings,
    ),

w_groupbox_3 = widget.GroupBox(  # DISC, MUS
    font="Font Awesome 6 Brands",
    visible_groups=[workspace_names[3], workspace_names[4]],
    **group_box_settings,
    ),      

w_groupbox_4 = widget.GroupBox(  # FILE, NOT
    font="Font Awesome 6 Free Solid",
    visible_groups=[workspace_names[5], workspace_names[6]],
    **group_box_settings,
    ),

# Links Individual w_groupbox widgets
def gen_groupbox():
    return (
        widget.GroupBox(  # WEB
            font="Font Awesome 6 Brands",
            visible_groups=[workspace_names[0]],
            **group_box_settings,
        ),
        widget.GroupBox(  # DEV, SYS
            font="Font Awesome 6 Free Solid",
            visible_groups=[workspace_names[1], workspace_names[2]],
            **group_box_settings,
        ),
        widget.GroupBox(  # DISC, MUS
            font="Font Awesome 6 Brands",
            visible_groups=[workspace_names[3], workspace_names[4]],
            **group_box_settings,
        ),
        widget.GroupBox(  # FILE, NOT
            font="Font Awesome 6 Free Solid",
            visible_groups=[workspace_names[5], workspace_names[6]],
            **group_box_settings,
        ),
    )

def gen_spacer():
    return widget.Spacer()

#Middle Window Name
w_window_name_icon = widget.TextBox(
    text=" ",
    foreground="#ffffff",
    font="Font Awesome 6 Free Solid",
	)

w_window_name = widget.WindowName(
    foreground="#ffffff",
    width=bar.CALCULATED,
    empty_group_string="Desktop",
    max_chars=40,
    parse_text=parse_window_name,
    mouse_callbacks={"Button1": toggle_maximize},
	)

w_systray = widget.Systray(
    padding=5,
	)

# Layout Indicator
def gen_current_layout():
    color = colors[10]

    return (
        widget.TextBox(
            text="",
            foreground=colors[1],
            font="Font Awesome 6 Free Solid",
            fontsize=15,
            padding=8,
            decorations=_left_decor(color),
            ),
    separator_sm(),
        widget.CurrentLayout(
            foreground=color,
            padding=8,
            decorations=_right_decor(color),
        ),
        separator(),
    )

# Volume Indicator
w_volume_icon = widget.TextBox(
    text="",
    foreground=colors[1],
    font="Font Awesome 6 Free Solid",
    fontsize=15,
    padding=8,
    decorations=_left_decor(colors[5]),
    )

w_volume = widget.PulseVolume(
    foreground=colors[5],
    imit_max_volume="True",
    padding=8,
    decorations=_right_decor(colors[5]),
    )

# Calendar
def gen_clock():
    color = colors[9]

    return (
        widget.TextBox(
            text="",
            font="JetBrainsMono Nerd Font",
            fontsize=16,
            foreground=colors[0],
            padding=8,
            decorations=_left_decor(color),
        ),
        separator_sm(),
        widget.Clock(
            format="%b %d, %H:%M",
            foreground=color,
            padding=8,
            decorations=_right_decor(color),
        ),
        separator(),
    )

# Power Menu
w_power = widget.TextBox(
    text="⏻",
    background=colors[7],
    foreground="#000000",
    font="Font Awesome 6 Free Solid",
    fontsize=18,
    padding=16,
)
