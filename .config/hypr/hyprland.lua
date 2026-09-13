hl.monitor({
  output = "eDP-1",
  mode="preffered",
  position="auto",
  scale=1.5
})

hl.monitor({
  output = "HDMI-A-1",
  mode="1920x1080",
  position="0x0",
  scale=1.5
})

hl.config({
  xwayland = {
    force_zero_scaling = true
  }
})

hl.on("hyprland.start", function ()
  hl.exec_cmd("awww-daemon")
  hl.exec_cmd("awww img .config/wall/cityskyline.gif")
  hl.exec_cmd("hyprctl switchxkblayout 'ite-tech.-inc.-ite-device(8176)-keyboard' 1")
  hl.exec_cmd("~/.config/hypr/xdg-portal-hyprland")
  hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
  hl.exec_cmd("systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
  hl.exec_cmd("wl-paste -pw wl-copy")
  hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
  hl.exec_cmd("wl-paste --type text --watch cliphist store")
  hl.exec_cmd("wl-clip-persist --clipboard regula")
end)

local terminal = "kitty -o allow_remote_control=yes -o enabled_layouts=tall"
local fileManager = "thunar"
local menu = "wofi --show drun"

hl.env("XCURSOR_SIZE", 24)
hl.env("QT_QPA_PLATFORMTHEME", "qt5ct")

-- NVIDIA env vars
hl.env("LIBVA_DRIVER_NAME", "nvidia")
hl.env("__GLX_VENDOR_LIBRARY_NAME", "nvidia")


-- Keyboards
hl.device({
  name="ite-tech.-inc.-ite-device(8176)-keyboard",
  kb_layout="us,us,ro",
  kb_variant=",dvorak,std"
})

hl.device({
  name = "epic-mouse-v1",
  sensitivity = -0.5
})


hl.config({
  general = {
    gaps_in = 3,
    gaps_out = 8,
    border_size = 2,
    col = {
      active_border = "rgba(33ccffee)",
      inactive_border = "rgba(595959aa)",
    },
    layout = "dwindle",

    allow_tearing = false

  },

  decoration = {
    rounding = 10,
    blur = {
        enabled = true,
        size = 3,
        passes = 1
    }
  },

  animations = {
    enabled = true,
  },

  dwindle = {
    preserve_split = true
  },

  misc = { force_default_wallpaper = 0 }
})


--animatii
hl.curve("myBezier", {type="bezier", points = { {0.05, 0.9}, {0.1, 1.05} } })

hl.animation({ leaf = "workspaces", enabled = true, speed = 6, bezier = "default" })
hl.animation({ leaf = "windows", enabled = true, speed = 7, bezier = "myBezier" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 7, bezier = "default", style = "popin 80%" })
hl.animation({ leaf = "border", enabled = true, speed = 10, bezier = "default" })
hl.animation({ leaf = "borderangle", enabled = true, speed = 8, bezier = "default" })
hl.animation({ leaf = "fade", enabled = true, speed = 7, bezier = "default" })

-- Binds
local mainMod = "SUPER"

hl.bind("SUPER + Y", hl.dsp.exec_cmd("hyprctl switchxkblayout 'ite-tech.-inc.-ite-device(8176)-keyboard' next"))

hl.bind("SUPER + Q", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + F1", hl.dsp.window.close())
hl.bind("SUPER + F2", hl.dsp.window.kill())

hl.bind("SUPER + M", hl.dsp.exec_cmd("wlogout"))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen({ action = "toggle" }))
hl.bind(mainMod .. " + SPACE", hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + P", hl.dsp.window.pseudo())
hl.bind(mainMod .. " + J", hl.dsp.layout("togglesplit"))


--change focus
hl.bind(mainMod .. " + left",  hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up",    hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down",  hl.dsp.focus({ direction = "down" }))

-- Switch workspaces with mainMod + [0-9]
-- Move active window to a workspace with mainMod + SHIFT + [0-9]
for i = 1, 10 do
    local key = i % 10 -- 10 maps to key 0
    hl.bind(mainMod .. " + " .. key,             hl.dsp.focus({ workspace = i}))
    hl.bind(mainMod .. " + SHIFT + " .. key,     hl.dsp.window.move({ workspace = i }))
end

hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up",   hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Laptop multimedia keys for volume and LCD brightness
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),      { locked = true, repeating = true })
hl.bind("XF86AudioMute",        hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),     { locked = true, repeating = true })
hl.bind("XF86AudioMicMute",     hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),   { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp",  hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"),                  { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown",hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"),                  { locked = true, repeating = true })

hl.bind(mainMod .. " + S", hl.dsp.exec_cmd("grim -g '$(slurp)' - | wl-copy"))

hl.bind(mainMod .. " + B", hl.dsp.exec_cmd("hyprpanel"))
hl.bind(mainMod .. " + SHIFT + B", hl.dsp.exec_cmd("hyprpanel -q"))

local suppressMaximizeRule = hl.window_rule({
    -- Ignore maximize requests from all apps. You'll probably like this.
    name  = "suppress-maximize-events",
    match = { class = ".*" },

    suppress_event = "maximize",
})
-- suppressMaximizeRule:set_enabled(false)

hl.window_rule({
    -- Fix some dragging issues with XWayland
    name  = "fix-xwayland-drags",
    match = {
        class      = "^$",
        title      = "^$",
        xwayland   = true,
        float      = true,
        fullscreen = false,
        pin        = false,
    },

    no_focus = true,
})

-- Layer rules also return a handle.
-- local overlayLayerRule = hl.layer_rule({
--     name  = "no-anim-overlay",
--     match = { namespace = "^my-overlay$" },
--     no_anim = true,
-- })
-- overlayLayerRule:set_enabled(false)

-- Hyprland-run windowrule
hl.window_rule({
    name  = "move-hyprland-run",
    match = { class = "hyprland-run" },

    move  = "20 monitor_h-120",
    float = true,
})
