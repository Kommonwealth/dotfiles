local awful = require("awful")
-- session manager
awful.util.spawn_with_shell(
  "/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &"
)

awful.spawn.with_shell(
    "fcitx5"
)
awful.util.spawn_with_shell(
  "$HOME/.fehbg &"
)
-- automatically hide the cursor
awful.util.spawn_with_shell(
  "unclutter --hide-on-touch &"
)
-- compositor
awful.util.spawn_with_shell(
  "picom"
)
