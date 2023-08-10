--- {{{ Imports
local wibox   = require("wibox")
local gears   = require("gears")
local awful   = require("awful")
local theme   = require("ui.theme")
local battery = require("ui.widgets.battery")
local layout  = require("ui.widgets.layout")
local wifi    = require("ui.widgets.wifi")
local volume  = require("ui.widgets.volume")
local clock   = require("ui.widgets.clock")


-- Textclock widget
local mytextclock = wibox.widget.textclock()
screen.connect_signal("request::desktop_decoration", function(s)
    -- Tag names for each screen
    awful.tag(
        {
            "1",
            "2",
            "3",
            "4",
            "5",
            "6",
            "7",
            "8",
            "9",
        },
    s,
    awful.layout.layouts[1]
    )

  --  Layoutbox widget
    s.mylayoutbox = {
        widget = wibox.container.background,
        bg = theme.bg_normal,
        shape = gears.shape.partially_rounded_rect,
        awful.widget.layoutbox {
            screen  = s,
            buttons = {
                awful.button({}, 1,
                    function()
                        awful.layout.inc(1)
                    end
                ),
                awful.button({}, 3,
                    function()
                        awful.layout.inc(-1)
                    end
                ),
                awful.button({}, 4,
                    function()
                        awful.layout.inc(-1)
                    end
                ),
                awful.button({}, 5,
                    function()
                        awful.layout.inc(1)
                    end
                ),
            }
        }
    }

  --  Taglist widget
    s.mytaglist = {
        widget = wibox.container.background,
        bg = theme.taglist_bg,
        shape = gears.shape.partailly_rounded_rect,
        awful.widget.taglist {
            screen  = s,
            filter  = awful.widget.taglist.filter.all,
            buttons = {
                awful.button({}, 1,
                    function(t)
                        t:view_only()
                    end
                ),
                awful.button({mod}, 1,
                    function(t)
                        if client.focus then
                            client.focus:move_to_tag(t)
                        end
                    end
                ),
                awful.button({}, 3,
                    awful.tag.viewtoggle
                ),
                awful.button({mod}, 3,
                    function(t)
                        if client.focus then
                            client.focus:toggle_tag(t)
                        end
                    end
                ),
                awful.button({}, 4,
                    function(t)
                        awful.tag.viewprev(t.screen)
                    end
                ),
                awful.button({}, 5,
                    function(t)
                        awful.tag.viewnext(t.screen)
                    end
                ),
            }
        }
    }

  -- Prepare custom widgets container
    local custom_widget_container = {
    -- Keyboard layout widget
    wibox.container.background(wibox.widget.textbox(" "), theme.bar_bg_red),
    --wibox.container.background(layout, theme.bar_bg_one),
    wibox.container.background(wibox.widget.textbox(" "), theme.bar_bg_red),
    -- Volume widget
        wibox.container.background(wibox.widget.textbox(" "), theme.bar_bg_green),
        wibox.container.background(volume, theme.bar_bg_green),
        wibox.container.background(wibox.widget.textbox(" "), theme.bar_bg_green),
    -- Battery widget
        wibox.container.background(wibox.widget.textbox(" "), theme.bar_bg_yellow),
        wibox.container.background(battery, theme.bar_bg_yellow),
        wibox.container.background(wibox.widget.textbox(" "), theme.bar_bg_yellow),
    -- Clock Widget
        wibox.container.background(wibox.widget.textbox(" "), theme.bar_bg_blue),
        wibox.container.background(clock, theme.bar_bg_blue),
        wibox.container.background(wibox.widget.textbox(" "), theme.bar_bg_blue),
    -- Wifi widget
        wibox.container.background(wibox.widget.textbox(" "), theme.bar_bg_magenta),
        wibox.container.background(wifi, theme.bar_bg_magenta),
        layout = wibox.layout.fixed.horizontal,
  }

  -- Main right widget container with pill shape
    local right_widgets = {
        custom_widget_container,
        widget = wibox.container.background,
        shape = gears.shape.partially_rounded_rect,
    }

  --  Wibar
    s.mywibox = awful.wibar {
        position     = "top",
        height       = (30),
        border_width = (4),
        margins = {
            top = 6,
            left = 6,
            right = 6,
            bottom = 0
        },
        border_color = theme.bg_normal,
        screen       = s,
        widget       = {
            layout = wibox.layout.stack,
            {
                layout = wibox.layout.align.horizontal,
                {
                    -- [[ Left widgets ]]
                    layout = wibox.layout.fixed.horizontal,
                    -- Layoubox widget
                    s.mylayoutbox,
                    wibox.container.background(wibox.widget.textbox(" "), theme.bg_normal),
                    -- Taglist widget
                    s.mytaglist,
                },
                nil,
                {
                    -- [[ Right widgets ]]
                    layout = wibox.layout.fixed.horizontal,
                    right_widgets
                },
            },
            {
                -- [[ Center widgets ]]
                -- Clock widget
                wibox.container.background(mytextclock, theme.bar_clock, gears.shape.partially_rounded_rect),
                valign = "center",
                halign = "center",
                layout = wibox.container.place,
            }
        }
    }
end
)
