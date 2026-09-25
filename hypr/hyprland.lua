------------------
---- MONITORS ----
------------------

-- Main monitor: Dell S3225QS
hl.monitor({ output = "HDMI-A-1", mode = "3840x2160@60", position = "0x0", scale = 1 })

-- Laptop screen, right of HDMI-A-1
hl.monitor({ output = "eDP-1", mode = "1920x1200@60", position = "3840x0", scale = 1 })


---------------------
---- MY PROGRAMS ----
---------------------

local terminal    = "kitty"
local fileManager = "dolphin"

local menu        = "wofi --show drun"

-------------------
---- AUTOSTART ----
-------------------

hl.on("hyprland.start", function()
    hl.exec_cmd("swaybg -i /home/olejorgen/sync_root/media/Unsorted/backgrounds/flowertampere.JPG -m fill")
end)

-------------------------------
---- ENVIRONMENT VARIABLES ----
-------------------------------

hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")

-----------------------
---- LOOK AND FEEL ----
-----------------------

hl.config({
    general = {
        gaps_in = 1,
        gaps_out = 2,
        border_size = 2,
        col = {
            active_border = { colors = { "rgba(33ccffee)", "rgba(00ff99ee)" }, angle = 45 },
            inactive_border = "rgba(595959aa)",
        },
        resize_on_border = false,
        allow_tearing = false,
        layout = "dwindle",
    },

    decoration = {
        rounding = 10,
        rounding_power = 2,
        active_opacity = 1.0,
        inactive_opacity = 1.0,
        shadow = {
            enabled = true,
            range = 4,
            render_power = 3,
            color = 0xee1a1a1a, 
        },
        blur = {
            enabled = true,
            size = 3,
            passes = 1,
            vibrancy = 0.1696,
        },
    },

    animations = { enabled = true },

    dwindle = { preserve_split = true },
    master  = { new_status = "master" },

    misc = {
        force_default_wallpaper = 0,
        disable_hyprland_logo = false,
    },

    input = {
        kb_layout = "no",
        kb_variant = "",
        kb_model = "",
        kb_options = "",
        kb_rules = "",
        follow_mouse = 1,
        sensitivity = 0,
        touchpad = { natural_scroll = false },
    },
})

--------------------
---- ANIMATIONS ----
--------------------

local function bezier(name, x0, y0, x1, y1)
    hl.curve(name, { type = "bezier", points = { { x0, y0 }, { x1, y1 } } })
end

bezier("easeOutQuint",   0.23, 1,    0.32, 1)
bezier("easeInOutCubic", 0.65, 0.05, 0.36, 1)
bezier("linear",         0,    0,    1,    1)
bezier("almostLinear",   0.5,  0.5,  0.75, 1)
bezier("quick",          0.15, 0,    0.1,  1)

local function anim(leaf, speed, curve, style)
    hl.animation({ leaf = leaf, enabled = true, speed = speed, bezier = curve, style = style })
end

anim("global",        10,   "default")
anim("border",        5.39, "easeOutQuint")
anim("windows",       4.79, "easeOutQuint")
anim("windowsIn",     4.1,  "easeOutQuint", "popin 87%")
anim("windowsOut",    1.49, "linear",       "popin 87%")
anim("fadeIn",        1.73, "almostLinear")
anim("fadeOut",       1.46, "almostLinear")
anim("fade",          3.03, "quick")
anim("layers",        3.81, "easeOutQuint")
anim("layersIn",      4,    "easeOutQuint", "fade")
anim("layersOut",     1.5,  "linear",       "fade")
anim("fadeLayersIn",  1.79, "almostLinear")
anim("fadeLayersOut", 1.39, "almostLinear")
anim("workspaces",    1.94, "almostLinear", "fade")
anim("workspacesIn",  1.21, "almostLinear", "fade")
anim("workspacesOut", 1.94, "almostLinear", "fade")
anim("zoomFactor",    7,    "quick")

---------------------------
---- GESTURES / DEVICES ----
---------------------------

hl.gesture({ fingers = 3, direction = "horizontal", action = "workspace" })

hl.device({ name = "epic-mouse-v1", sensitivity = -0.5 })

---------------------
---- KEYBINDINGS ----
---------------------

local mainMod = "SUPER"
local function key(k) return mainMod .. " + " .. k end

hl.bind(key("Q"), hl.dsp.exec_cmd(terminal))
hl.bind(key("C"), hl.dsp.window.close())
hl.bind(key("M"), hl.dsp.exit())
hl.bind(key("E"), hl.dsp.exec_cmd(fileManager))
hl.bind(key("V"), hl.dsp.window.float({ action = "toggle" }))
hl.bind(key("R"), hl.dsp.exec_cmd(menu))
-- hl.bind(key("P"), hl.dsp.window.pseudo())
-- hl.bind(key("J"), hl.dsp.layout("togglesplit"))

-- Move focus (vim keys)
hl.bind(key("h"), hl.dsp.focus({ direction = "left" }))
hl.bind(key("l"), hl.dsp.focus({ direction = "right" }))
hl.bind(key("k"), hl.dsp.focus({ direction = "up" }))
hl.bind(key("j"), hl.dsp.focus({ direction = "down" }))

-- Workspaces: SUPER + [1-0] to switch, SUPER + SHIFT + [1-0] to move window
for i = 1, 10 do
    local k = i % 10
    hl.bind(key(k), hl.dsp.focus({ workspace = i }))
    hl.bind(key("SHIFT + " .. k), hl.dsp.window.move({ workspace = i }))
end

-- Move/resize with mouse
hl.bind(key("mouse:272"), hl.dsp.window.drag(),   { mouse = true })
hl.bind(key("mouse:273"), hl.dsp.window.resize(), { mouse = true })

-- Screenshot / screen recording
hl.bind(key("Z"), hl.dsp.exec_cmd('grim -g "$(slurp)" - | swappy -f -'))
hl.bind(key("G"), hl.dsp.exec_cmd('wf-recorder -g "$(slurp)" -f output.mp4'))
