local awful = require("awful")
local hotkeys_popup = require("awful.hotkeys_popup"); require("awful.hotkeys_popup.keys")
local apps = require("apps")
require("awful.autofocus")

-- Modkeys
mod = "Mod1"
con = "Control"
shi = "Shift"

-- Main Keybinds
awful.keyboard.append_global_keybindings({
    awful.key({mod}, "s",
        hotkeys_popup.show_help, {
        description = "Show the Help Menu",
        group = "Main"
    }),

    awful.key({mod, con}, "r",
        awesome.restart, {
        description = "Reload Awesome",
        group = "Main"
    }),

    awful.key({mod, con}, "q",
        awesome.quit, {
        description = "Quit Awesome",
        group = "Main"
    }),

    awful.key({mod}, "Return",
        function()
            awful.spawn(apps.terminal)
        end, {
        description = "Open the Terminal",
        group = "Main"
    }),
})

-- Tag Keybinds
awful.keyboard.append_global_keybindings({
    awful.key({mod}, "Left",
        awful.tag.viewprev, {
        description = "Advance to Next Tag",
        group = "Tags"
    }),

    awful.key({mod}, "Right",
        awful.tag.viewnext, {
        description = "Return to Last Tag",
        group = "Tags"
    }),

    awful.key({mod}, "Escape",
        awful.tag.history.restore, {
        description = "Return to Previous Tag in History",
        group = "Tags"
    }),

    awful.key {
        modifiers   = {mod},
        keygroup    = "numrow",
        description = "Switch Tags",
        group       = "Tags",
        on_press    = function(index)
            local screen = awful.screen.focused()
            local tag = screen.tags[index]
            if tag then
                tag:view_only()
            end
        end,
    },

    awful.key {
        modifiers   = {mod, con},
        keygroup    = "numrow",
        description = "View Contents of Another Tag",
        group       = "Tags",
        on_press    = function(index)
            local screen = awful.screen.focused()
            local tag = screen.tags[index]
            if tag then
                awful.tag.viewtoggle(tag)
            end
        end,
    },

    awful.key {
        modifiers   = {mod, shi},
        keygroup    = "numrow",
        description = "Move Focused Window to Another Tag",
        group       = "Tags",
        on_press    = function(index)
            if client.focus then
            local tag = client.focus.screen.tags[index]
                if tag then
                    client.focus:move_to_tag(tag)
                end
            end
        end,
    },

    awful.key {
        modifiers   = {mod, con, shi},
        keygroup    = "numrow",
        description = "View focused window on more than one tag with number keys from {1 to 9}",
        group       = "Tags",
        on_press    = function(index)
            if client.focus then
            local tag = client.focus.screen.tags[index]
                if tag then
                    client.focus:toggle_tag(tag)
                end
            end
        end,
    },
})

-- Focus Keybinds
awful.keyboard.append_global_keybindings({

    awful.key({mod}, "j",
        function()
            awful.client.focus.byidx(1)
        end, {
        description = "Focus the Next Window",
        group = "Focus"
    }),

    awful.key({mod}, "k",
        function()
            awful.client.focus.byidx(-1)
        end, {
        description = "Focus the Previous Window by Index",
        group = "Focus"
    }),

    awful.key({mod}, "Tab",
        function()
            awful.client.focus.history.previous()
            if client.focus then
                client.focus:raise()
            end
        end, {
        description = "Focus the Previous Window by History",
        group = "Focus"
    }),

    awful.key({mod, con}, "j",
        function()
            awful.screen.focus_relative(1)
        end, {
        description = "Focus the Next Screen",
        group = "Focus"
    }),

    awful.key({mod, con}, "k",
        function()
            awful.screen.focus_relative(-1)
        end, {
        description = "Focus the Previous Screen",
        group = "Focus"
    }),
})

-- Layouts
awful.keyboard.append_global_keybindings({
    awful.key({mod, shi}, "j",
        function()
            awful.client.swap.byidx(1)
        end, {
        description = "Swap with next window in current layout by index",
        group = "Layouts"
    }),

    awful.key({mod, shi}, "k",
        function()
            awful.client.swap.byidx(-1)
        end, {
        description = "Swap with previous window in current layout by index",
        group = "Layouts"
    }),

    awful.key({mod}, "l",
        function()
            awful.tag.incmwfact(0.05)
        end, {
        description = "Increase master window width size",
        group = "Layout keybinds"
    }),

    awful.key({mod}, "h",
        function()
            awful.tag.incmwfact(-0.05)
        end, {
        description = "Decrease master window width size",
        group = "Layout keybinds"
    }),

    awful.key({mod, shi}, "h",
        function()
            awful.tag.incnmaster(1, nil, true)
        end, {
        description = "Increase the number of master windows",
        group = "Layout keybinds"
    }),

    awful.key({mod, shi}, "l",
        function()
            awful.tag.incnmaster(-1, nil, true)
        end, {
        description = "Decrease the number of master windows",
        group = "Layout keybinds"
    }),

    awful.key({mod, con}, "h",
        function()
            awful.tag.incncol(1, nil, true)
        end, {
        description = "Increase the number of columns in layout",
        group = "Layout keybinds"
    }),

    awful.key({mod, con}, "l",
        function()
            awful.tag.incncol(-1, nil, true)
        end, {
        description = "Decrease the number of columns in layout",
        group = "Layout keybinds"
    }),

    awful.key({mod}, "space",
        function()
            awful.layout.inc(1)
        end, {
        description = "Switch to the next layout",
        group = "Layout keybinds"
    }),

    awful.key({mod, shi}, "space",
        function()
            awful.layout.inc(-1)
        end, {
        description = "Switch to previous layout",
        group = "Layout keybinds"
    }),

    awful.key {
        modifiers   = {mod},
        keygroup    = "numpad",
        description = "Select layouts directly using the numpad",
        group       = "layout",
        on_press    = function(index)
            local t = awful.screen.focused().selected_tag
            if t then
                t.layout = t.layouts[index] or t.layout
            end
        end,
    },

    awful.key({mod}, "b",
        function()
            for s in screen do
                s.mywibox.visible = not s.mywibox.visible
                if s.mybottomwibox then
                    s.mybottomwibox.visible = not s.mybottomwibox.visible
                end
            end
        end, {
        description = "Toggle the bar",
        group = "Layout keybinds"
    }),
})

-- Window Keybinds
client.connect_signal(
    "request::default_keybindings",
    function()
        awful.keyboard.append_client_keybindings({
            awful.key({mod}, "f",
            function(c)
                c.fullscreen = not c.fullscreen
                c:raise()
            end, {
            description = "Toggle fullscreen",
            group = "Window keybinds"
        }),

        awful.key({mod},"w",
            function(c)
                c:kill()
            end, {
            description = "Close focused window",
            group = "Window keybinds"
        }),

        awful.key({mod, con}, "space",
            awful.client.floating.toggle, {
            description = "Toggle floating mode on focused window",
            group = "Window keybinds"
        }),

        awful.key({mod, con}, "Return",
            function(c)
                c:swap(
                awful.client.getmaster())
            end, {
            description = "Move focused window to master",
            group = "Window keybinds"
        }),

        awful.key({mod}, "o",
            function(c)
                c:move_to_screen()
            end, {
            description = "Move focused window to the next screen",
            group = "Window keybinds"
        }),

        awful.key({mod}, "t",
            function(c)
                c.ontop = not c.ontop
            end, {
            description = "Toggle keep on top for focused window",
            group = "Window keybinds"
        }),

        awful.key({mod}, "u",
            awful.client.urgent.jumpto, {
            description = "Quickly jump to urgent window",
            group = "Window keybinds"
        }),
    })
    end
)

--[[ Quick keybinds ]]
awful.keyboard.append_global_keybindings(
  {
    awful.key({}, "XF86AudioRaiseVolume",
        function()
            awful.spawn("pamixer -i 5")
        end, {
        description = "Increase volume by +5%",
        group = "Quick keybinds"
    }),

    awful.key({}, "XF86AudioLowerVolume",
        function()
            awful.spawn("pamixer -d 5")
        end, {
        description = "Decrease volume by +5%",
        group = "Quick keybinds"
    }),

    awful.key({}, "XF86AudioMute",
        function()
            awful.spawn("pamixer -t")
        end, {
        description = "Mute volume",
        group = "Quick keybinds"
    }),

    awful.key({}, "XF86AudioMicMute",
        function()
            awful.spawn("pamixer --default-source -t")
        end, {
        description = "Mute microphone",
        group = "Quick keybinds"
    }),

    awful.key({}, "XF86MonBrightnessUp",
        function()
            awful.spawn("xbacklight -inc 10")
        end, {
        description = "Increase brightness by +10%",
        group = "Quick keybinds"
    }),

    awful.key({}, "XF86MonBrightnessDown",
        function()
            awful.spawn("xbacklight -dec 10")
        end, {
        description = "Decrease brightness by +10%",
        group = "Quick keybinds"
    }),

    awful.key({}, "XF86Display",
        function()
            awful.spawn("arandr")
        end, {
        description = "Configure the display using arandr",
        group = "Quick keybinds"
    }),

    awful.key({mod}, "a",
        function()
            local grabber
            grabber = awful.keygrabber.run(
                function(_, key, event)
                if event == "release" then
                    return
                end
                if key == "1" then
                    awful.util.spawn(apps.browser)     -- TAG 1
                elseif key == "2" then
                    awful.util.spawn(apps.file)        -- TAG 2
                elseif key == "3" then
                    awful.util.spawn(apps.study)       -- TAG 3
                elseif key == "4" then
                    awful.util.spawn(apps.chat)        -- TAG 4
                elseif key == "5" then
                    awful.util.spawn(apps.music)       -- TAG 5
                elseif key == "6" then
                    awful.util.spawn(apps.videoeditor) -- TAG 5
                elseif key == "7" then
                    awful.util.spawn(apps.imageeditor) -- TAG 5
                elseif key == "8" then
                    awful.util.spawn(apps.noteapp)     -- TAG 8
                elseif key == "9" then
                    awful.util.spawn(apps.game)        -- TAG 9
                end
                    awful.keygrabber.stop(grabber)
                end
            )
        end, {
        description = "Launch apps with {Super + a} keychord and then numbers from {1 to 9}",
        group = "Quick keybinds"
    }),

    awful.key({mod}, "x",
        function()
            local grabber
            grabber = awful.keygrabber.run(
                function(_, key, event)
                    if event == "release" then
                        return
                    end
                    if key == "e" then
                        awful.util.spawn("setxkbmap us")
                    elseif key == "i" then
                        awful.util.spawn("setxkbmap it")
                    elseif key == "c" then
                        awful.util.spawn("setxkbmap cn")
                    end
                awful.keygrabber.stop(grabber)
            end
        )
    end, {
        description = "Change keyboard layout with {Super + x} keychord and then {e} for spanish and {u} for english",
        group = "Quick keybinds"
    }),

    awful.key({mod}, "p",
        function()
            local grabber
            grabber = awful.keygrabber.run(
                function(_, key, event)
                    if event == "release" then
                        return
                    end
                    if key == "d" then
                        awful.util.spawn(apps.drunner)
                    elseif key == "r" then
                        awful.util.spawn(apps.runner)
                    elseif key == "q" then
                        awful.spawn.with_shell(apps.runner_power)
                    elseif key == "i" then
                        awful.spawn.with_shell(apps.runner_wifi)
                    elseif key == "s" then
                        awful.spawn.with_shell(apps.runner_scrot)
                    elseif key == "e" then
                        awful.spawn.with_shell(apps.runner_emoji)
                    elseif key == "w" then
                        awful.spawn.with_shell(apps.runner_wall)
                    elseif key == "m" then
                        awful.spawn.with_shell(apps.runner_mount)
                    elseif key == "b" then
                        awful.spawn.with_shell(apps.runner_blue)
                    end
                awful.keygrabber.stop(grabber)
            end
        )
    end, {
        description = "Launch quick action menus with {Super + p} keychord and then {d, r, e, q, i, b, s, z, w}",
        group = "Quick keybinds"
    }),

    awful.key({mod}, "t",
        function()
            local grabber
            grabber = awful.keygrabber.run(
                function(_, key, event)
                    if event == "release" then
                        return
                    end
                    if key == "y" then
                        awful.util.spawn(apps.vidytfzf)
                    elseif key == "m" then
                        awful.util.spawn(apps.musytfzf)
                    elseif key == "a" then
                        awful.util.spawn(apps.ani_cli)
                    elseif key == "f" then
                        awful.util.spawn(apps.flix_cli)
                    elseif key == "r" then
                        awful.util.spawn(apps.newsboat)
                    elseif key == "b" then
                        awful.util.spawn(apps.btop)
                    elseif key == "h" then
                        awful.util.spawn(apps.htop)
                    elseif key == "p" then
                        awful.util.spawn(apps.pulsemixer)
                    elseif key == "o" then
                        awful.util.spawn(apps.alsamixer)
                    end
                awful.keygrabber.stop(grabber)
             end
        )
    end, {
        description = "Launch multimedia terminal scripts with {Super + t} and then {m, y, a, f}",
        group = "Quick keybinds"
    }),
})
