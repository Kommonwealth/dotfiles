local gears                    = require("gears")
local dpi                      = require("beautiful.xresources").apply_dpi
local beautiful                = require("beautiful")
local colors                   = require("ui.colors")

local themes_path              = string.format("%s/.config/awesome/ui/", os.getenv("HOME"))

-- {{{ Main
local theme                    = {}
-- }}}

-- {{{ theme font
theme.font                     = "DinaRemaster Nerd Font"
--- }}}

-- {{{ bar colors
theme.bar_bg_red               = colors.red
theme.bar_bg_green             = colors.green
theme.bar_bg_yellow            = colors.yellow
theme.bar_bg_blue              = colors.blue
theme.bar_bg_magenta           = colors.magenta
theme.bar_bg_cyan              = colors.cyan
theme.bar_bg_orange            = colors.orange
theme.bar_clock                = colors.bg1
--- }}}

-- {{{ Colors
theme.fg_normal                = colors.fg
theme.fg_focus                 = colors.fg
theme.fg_urgent                = colors.red
theme.bg_normal                = colors.bg
theme.bg_focus                 = colors.bg1
theme.bg_urgent                = colors.fg
-- }}}

-- {{{ Borders
beautiful.gap_single_client    = true
theme.useless_gap              = dpi(3)
theme.border_width             = dpi(1)
theme.border_normal            = colors.white
theme.border_focus             = colors.lwhite
theme.border_marked            = colors.lwhite
-- }}}

-- {{{ Taglist
theme.taglist_font             = "DinaRemaster Nerd Font 13"
theme.taglist_bg               = colors.bg1
theme.taglist_fg_focus         = colors.lorange
theme.taglist_fg_occupied      = colors.lwhite
theme.taglist_fg_urgent        = colors.red
theme.taglist_fg_empty         = colors.white
theme.taglist_spacing          = 7
-- }}}

-- {{{ Notifications
theme.notification_font        = "DinaRemaster Nerd Font 13"
theme.notification_bg          = colors.bg1
theme.notification_bg_alt      = colors.green
theme.notification_fg          = colors.fg
theme.notification_fg_alt      = colors.fg
theme.notification_critical    = colors.fg
theme.notification_shape       = gears.shape.partially_rounded_rect
-- }}}

-- {{{ Hotkeys Popup
theme.hotkeys_bg               = colors.bg
theme.hotkeys_fg               = colors.fg
theme.hotkeys_modifiers_fg     = colors.green
theme.hotkeys_label_bg         = colors.cyan
theme.hotkeys_label_fg         = colors.fg
theme.hotkeys_group_margin     = dpi(20)
theme.hotkeys_description_font = "DinaRemaster Nerd Font 13"
theme.hotkeys_font             = "DinaRemaster Nerd Font 13"
-- }}}

-- {{{ Mouse finder
theme.mouse_finder_color       = colors.red
theme.mouse_finder_radius      = dpi(5)
theme.mouse_finder_timeout     = 10
-- }}}

-- {{{ Layout Icons
theme.layout_tile              = gears.color.recolor_image(themes_path .. "icons/tilew.png", theme.fg_urgent)
theme.layout_centerwork        = gears.color.recolor_image(themes_path .. "icons/centerworkw.png", theme.fg_urgent)
theme.layout_tileleft          = gears.color.recolor_image(themes_path .. "icons/tileleftw.png", theme.fg_urgent)
theme.layout_tilebottom        = gears.color.recolor_image(themes_path .. "icons/tilebottomw.png", theme.fg_urgent)
theme.layout_tiletop           = gears.color.recolor_image(themes_path .. "icons/tiletopw.png", theme.fg_urgent)
theme.layout_fairv             = gears.color.recolor_image(themes_path .. "icons/fairvw.png", theme.fg_urgent)
theme.layout_fairh             = gears.color.recolor_image(themes_path .. "icons/fairhw.png", theme.fg_urgent)
theme.layout_spiral            = gears.color.recolor_image(themes_path .. "icons/spiralw.png", theme.fg_urgent)
theme.layout_dwindle           = gears.color.recolor_image(themes_path .. "icons/dwindlew.png", theme.fg_urgent)
theme.layout_max               = gears.color.recolor_image(themes_path .. "icons/maxw.png", theme.fg_urgent)
theme.layout_fullscreen        = gears.color.recolor_image(themes_path .. "icons/fullscreenw.png", theme.fg_urgent)
theme.layout_magnifier         = gears.color.recolor_image(themes_path .. "icons/magnifierw.png", theme.fg_urgent)
theme.layout_floating          = gears.color.recolor_image(themes_path .. "icons/floatingw.png", theme.fg_urgent)
theme.layout_cornernw          = gears.color.recolor_image(themes_path .. "icons/cornernw.png", theme.fg_urgent)
theme.layout_cornerne          = gears.color.recolor_image(themes_path .. "icons/cornerne.png", theme.fg_urgent)
theme.layout_cornersw          = gears.color.recolor_image(themes_path .. "icons/cornersw.png", theme.fg_urgent)
theme.layout_cornerse          = gears.color.recolor_image(themes_path .. "icons/cornerse.png", theme.fg_urgent)
-- }}}

return theme
