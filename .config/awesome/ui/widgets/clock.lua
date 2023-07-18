local wibox = require("wibox")
local awful = require("awful")


local clock_widget = wibox.widget {
    wibox.widget.textbox(" "),
    wibox.widget.textclock("%b %d, %I:%M"),
    layout = wibox.layout.align.horizontal
}

clock_widget.tooltip = awful.tooltip {
    objects = {clock_widget},
    timer_function = function()
        local calendar = os.date('Today is %A %B %d %Y\nThe time is %T')
        return calendar
    end
}

return clock_widget
