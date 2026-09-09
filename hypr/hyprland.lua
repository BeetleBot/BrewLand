-- Hyprland Lua Configuration
-- Migrated from .conf files in HLconfigs/

------------------
---- MONITORS ----
------------------

hl.monitor({
    output   = "",
    mode     = "preferred",
    position = "auto",
    scale    = "auto",
})


---------------------
---- MY PROGRAMS ----
---------------------

local terminal    = "kitty"
local fileManager = "thunar"
local browser     = "zen-browser"
local menu        = "rofi -show drun"
local mainMod     = "SUPER"


-------------------
---- AUTOSTART ----
-------------------

hl.on("hyprland.start", function () 
    -- Services
    hl.exec_cmd("waybar")
    hl.exec_cmd("awww-daemon & disown")
    hl.exec_cmd("vicinae server & disown")
    hl.exec_cmd("hyprshot & disown")
    hl.exec_cmd("hypridle & disown")
    hl.exec_cmd("systemctl --user start hyprpolkitagent")
    hl.exec_cmd("fcitx5 -d --replace")
    hl.exec_cmd("wl-paste --type text --watch cliphist store")
    hl.exec_cmd("wl-paste --type image --watch cliphist store")
    hl.exec_cmd("systemctl --user start mpd-mpris")
    hl.exec_cmd("swayosd-server & disown")

    -- Desktop environment
    hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
    hl.exec_cmd("systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")

    -- Appearance
    hl.exec_cmd("gsettings set org.gnome.desktop.interface cursor-theme 'Bibata-Modern-Ice'")
    hl.exec_cmd("gsettings set org.gnome.desktop.interface cursor-size 24")
end)


-------------------------------
---- ENVIRONMENT VARIABLES ----
-------------------------------

hl.env("XMODIFIERS", "@im=fcitx")
hl.env("XCURSOR_THEME", "Bibata-Modern-Ice")
hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_THEME", "Bibata-Modern-Ice")
hl.env("HYPRCURSOR_SIZE", "24")
hl.env("QT_QPA_PLATFORMTHEME", "qt5ct")
hl.env("QT_STYLE_OVERRIDE", "kvantum")


-----------------------
---- LOOK AND FEEL ----
-----------------------

local colors = dofile(os.getenv("HOME") .. "/.config/hypr/themes/colors.lua")
local active_border = colors.active_border
local inactive_border = colors.inactive_border
local group_active = colors.group_active
local group_inactive = colors.group_inactive
local accent_color = colors.accent_color

hl.config({
    general = {
        gaps_in = 2,
        gaps_out = 5,
        border_size = 1,
        col = {
            active_border = active_border,
            inactive_border = inactive_border,
        },
        resize_on_border = true,
        allow_tearing = false,
        layout = "scrolling",
    },

    scrolling = {
        column_width = 0.8,
        fullscreen_on_one_column = false,
    },

    master = {
        new_status = "slave",
        new_on_top = false,
        mfact = 0.60,
        orientation = "left",
    },

    dwindle = {
        preserve_split = true,
    },

    decoration = {
        rounding = 0,
        rounding_power = 2.0,
        active_opacity = 1,
        inactive_opacity = 1,

        blur = {
            enabled = true,
            size = 5,
            passes =3,
            vibrancy = 1,
        },

        shadow = {
            enabled = true,
            range = 20,
            render_power = 4,
            color = "rgba(00000044)",
        },
    },

    group = {
        col = {
            border_active = active_border,
            border_inactive = inactive_border,
        },

        groupbar = {
            font_family = "GeistMono Nerd Font Propo",
            font_size = 13,
            height = 24,
            render_titles = true,
            scrolling = true,
            gradients = true,
            col = {
                active = group_active,
                inactive = group_inactive,
            },
            text_color = "rgba(1e1e2eff)",
        },
    },

    misc = {
        force_default_wallpaper = 0,
        disable_hyprland_logo = true,
    },
})

-- Animations
hl.curve("fast", { type = "bezier", points = { {0, 1}, {0, 1} } })
hl.curve("defaultBezier", { type = "bezier", points = { {0.05, 0.9}, {0.1, 1.05} } })

hl.animation({ leaf = "windowsIn", enabled = true, speed = 7, bezier = "defaultBezier", style = "popin 80%" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 2, bezier = "fast", style = "popin 100%" })
hl.animation({ leaf = "windowsMove", enabled = true, speed = 2, bezier = "fast" })
hl.animation({ leaf = "fade", enabled = true, speed = 2, bezier = "fast" })
hl.animation({ leaf = "fadeIn", enabled = true, speed = 2, bezier = "fast" })
hl.animation({ leaf = "fadeOut", enabled = true, speed = 2, bezier = "fast" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 4, bezier = "defaultBezier", style = "slide" })
hl.animation({ leaf = "specialWorkspace", enabled = true, speed = 3, bezier = "defaultBezier", style = "fade" })
hl.animation({ leaf = "layers", enabled = true, speed = 2, bezier = "fast", style = "fade" })


---------------
---- INPUT ----
---------------

hl.config({
    input = {
        kb_layout = "us",
        follow_mouse = 1,
        sensitivity = 0.3,

        touchpad = {
            natural_scroll = false,
        },
    },
})

hl.gesture({
    fingers = 3,
    direction = "horizontal",
    action = "workspace"
})

hl.device({
    name = "epic-mouse-v1",
    sensitivity = -0.5,
})


---------------------
---- KEYBINDINGS ----
---------------------

-- System
hl.bind(mainMod .. " + RETURN", hl.dsp.exec_cmd(terminal)) -- [desc: Open Terminal]
hl.bind(mainMod .. " + SHIFT + L", hl.dsp.exec_cmd("hyprlock")) -- [desc: Lock Screen]
hl.bind(mainMod .. " + Q", hl.dsp.window.close()) -- [desc: Close Window]
hl.bind(mainMod .. " + X", hl.dsp.exit()) -- [desc: Exit Hyprland]
hl.bind(mainMod .. " + N", hl.dsp.exec_cmd("swaync-client -t")) -- [desc: Toggle Notification Center]
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager)) -- [desc: File Manager]
hl.bind(mainMod .. " + ALT + N", hl.dsp.exec_cmd("~/.config/rofi/scripts/wifi_menu.sh")) -- [desc: Network Manager]
hl.bind(mainMod .. " + ALT + B", hl.dsp.exec_cmd("kitty --class bluetui -e bluetui")) -- [desc: Bluetooth Manager]

-- Applications
hl.bind(mainMod .. " + W", hl.dsp.exec_cmd(browser)) -- [desc: Default Web browser (Set in myprograms.conf)]
hl.bind(mainMod .. " + O", hl.dsp.exec_cmd("obsidian")) -- [desc: Obsidian]
hl.bind(mainMod .. " + C", hl.dsp.exec_cmd("codium")) -- [desc: VS Code]

-- Rofi
hl.bind(mainMod .. " + SPACE", hl.dsp.exec_cmd(menu)) -- [desc: App Menu]
hl.bind(mainMod .. " + SLASH", hl.dsp.exec_cmd("~/.config/rofi/scripts/clipboard.sh")) -- [desc: Clipboard History]
hl.bind(mainMod .. " + PERIOD", hl.dsp.exec_cmd("~/.config/rofi/scripts/emoji.sh")) -- [desc: Emoji Picker]
hl.bind(mainMod .. " + L", hl.dsp.exec_cmd("~/.config/rofi/scripts/layout_switcher.sh")) -- [desc: Layout Switcher]
hl.bind(mainMod .. " + SHIFT + W", hl.dsp.exec_cmd("~/.config/rofi/scripts/wallpaper_menu.sh")) -- [desc: Wallpaper Menu]
hl.bind(mainMod .. " + SHIFT + M", hl.dsp.exec_cmd("~/.config/rofi/scripts/music_menu.sh")) -- [desc: Music Menu]
hl.bind(mainMod .. " + SHIFT + X", hl.dsp.exec_cmd("~/.config/rofi/scripts/power_menu.sh")) -- [desc: Power Menu]
hl.bind(mainMod .. " + SHIFT + P", hl.dsp.exec_cmd("~/.config/rofi/scripts/package_menu.sh")) -- [desc: Package Menu]
hl.bind(mainMod .. " + SHIFT + A", hl.dsp.exec_cmd("~/.config/rofi/scripts/audio_switcher.sh")) -- [desc: Audio Switcher]
hl.bind(mainMod .. " + H", hl.dsp.exec_cmd("~/.config/rofi/scripts/brew-keys.sh")) -- [desc: Cheat Sheet]
hl.bind(mainMod .. " + SHIFT + F", hl.dsp.exec_cmd("~/.config/rofi/scripts/file_manager.sh")) -- [desc: File Manager Menu]

-- Scripts
hl.bind(mainMod .. " + SHIFT + D", hl.dsp.exec_cmd("~/.config/brewland/drive.sh")) -- [desc: Mount Drive]
hl.bind(mainMod .. " + SHIFT + B", hl.dsp.exec_cmd("~/.config/brewland/backupdrive.sh")) -- [desc: Backup Drive]
hl.bind(mainMod .. " + R", hl.dsp.exec_cmd("~/.config/brewland/relaunchwaybarswaync.sh")) -- [desc: Refresh UI]
hl.bind(mainMod .. " + SHIFT + Z", hl.dsp.exec_cmd("~/.config/brewland/theme_switcher.sh")) -- [desc: Theme Switcher]
hl.bind(mainMod .. " + P", hl.dsp.exec_cmd("~/.config/brewland/toggle_power.sh")) -- [desc: Power Profile]

-- Screenshots
hl.bind(mainMod .. " + ALT + 1", hl.dsp.exec_cmd("grimblast --notify copysave output")) -- [desc: Screenshot Screen]
hl.bind(mainMod .. " + ALT + 2", hl.dsp.exec_cmd("grimblast --notify copysave active")) -- [desc: Screenshot Window]
hl.bind(mainMod .. " + ALT + 3", hl.dsp.exec_cmd("grimblast --notify --freeze copysave area")) -- [desc: Screenshot Selection]

-- Window management
hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" })) -- [desc: Toggle Float]
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen()) -- [desc: Toggle Fullscreen]
hl.bind(mainMod .. " + left",  hl.dsp.focus({ direction = "left" })) -- [desc: Focus Left]
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" })) -- [desc: Focus Right]
hl.bind(mainMod .. " + up",    hl.dsp.focus({ direction = "up" })) -- [desc: Focus Up]
hl.bind(mainMod .. " + down",  hl.dsp.focus({ direction = "down" })) -- [desc: Focus Down]
hl.bind(mainMod .. " + SHIFT + V", hl.dsp.window.pin()) -- [desc: Pin Window]

-- Scrolling layout controls
hl.bind(mainMod .. " + SHIFT + left",  hl.dsp.layout("swapcol l"))
hl.bind(mainMod .. " + SHIFT + right", hl.dsp.layout("swapcol r"))
hl.bind(mainMod .. " + SHIFT + up",    hl.dsp.layout("colresize +0.1"))
hl.bind(mainMod .. " + SHIFT + down",  hl.dsp.layout("colresize -0.1"))
hl.bind(mainMod .. " + SHIFT + RETURN",hl.dsp.layout("colresize 1.0"))
hl.bind(mainMod .. " + mouse_down", hl.dsp.window.cycle_next())
hl.bind(mainMod .. " + mouse_up",   hl.dsp.window.cycle_next({ next = false }))

-- Workspaces
hl.bind(mainMod .. " + S",         hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))
hl.bind(mainMod .. " + ALT + S",   hl.dsp.window.move({ workspace = "+0" }))

for i = 1, 10 do
    local key = i % 10
    hl.bind(mainMod .. " + " .. key,         hl.dsp.focus({ workspace = i }))
    hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

hl.bind(mainMod .. " + SHIFT + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + SHIFT + mouse_up",   hl.dsp.focus({ workspace = "e-1" }))

-- Mouse
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Multimedia
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("swayosd-client --output-volume raise"),       { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("swayosd-client --output-volume lower"),       { locked = true, repeating = true })
hl.bind("XF86AudioMute",        hl.dsp.exec_cmd("swayosd-client --output-volume mute-toggle"), { locked = true, repeating = true })
hl.bind("XF86AudioMicMute",     hl.dsp.exec_cmd("swayosd-client --input-volume mute-toggle"),  { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp",  hl.dsp.exec_cmd("swayosd-client --brightness raise"),          { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown",hl.dsp.exec_cmd("swayosd-client --brightness lower"),          { locked = true, repeating = true })

hl.bind("XF86AudioNext",  hl.dsp.exec_cmd("swayosd-client --playerctl next"),       { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("swayosd-client --playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay",  hl.dsp.exec_cmd("swayosd-client --playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev",  hl.dsp.exec_cmd("swayosd-client --playerctl previous"),   { locked = true })
hl.bind("XF86AudioStop",  hl.dsp.exec_cmd("swayosd-client --playerctl stop"),       { locked = true })


--------------------------------
---- WINDOWS AND WORKSPACES ----
--------------------------------

hl.window_rule({
    name = "suppress-maximize",
    match = { class = ".*" },
    suppress_event = "maximize",
})

hl.window_rule({
    name = "fix-xwayland-drags",
    match = {
        class = "^$",
        title = "^$",
        xwayland = true,
        float = true,
        fullscreen = false,
        pin = false,
    },
    no_focus = true,
})

hl.window_rule({
    name = "no-blur-empty",
    match = { class = "^()$", title = "^()$" },
    no_blur = true,
})

-- Thunar
hl.window_rule({
    name = "thunar-ops",
    match = { class = "^(thunar)$", title = "^(File Operation Progress)$" },
    float = true,
})
hl.window_rule({
    name = "thunar-confirm",
    match = { class = "^(thunar)$", title = "^(Confirm to replace files)$" },
    float = true,
})
hl.window_rule({
    name = "thunar-rename",
    match = { class = "^(thunar)$", title = "^(Rename.*)$" },
    float = true,
    center = true,
    size = "400 150",
})

-- File pickers
hl.window_rule({
    name = "gtk-portal",
    match = { class = "^(xdg-desktop-portal-gtk)$" },
    float = true,
    size = "800 500",
    center = true,
})

-- Layer rules
local layers_to_blur = {
    { name = "rofi-blur", match = "rofi", alpha = 0.5 },
    { name = "waybar-blur", match = "waybar", alpha = 0.5 },
    { name = "hyprlock-blur", match = "hyprlock", alpha = 0.2 },
    { name = "swaync-notify-blur", match = "swaync-notification-window", alpha = 0.2 },
    { name = "swaync-cc-blur", match = "swaync-control-center", alpha = 0.2 },

}

for _, layer in ipairs(layers_to_blur) do
    hl.layer_rule({
        name = layer.name,
        match = { namespace = layer.match },
        blur = true,
        ignore_alpha = layer.alpha,
    })
end

-- Picture-in-picture
hl.window_rule({
    name = "pip",
    match = { title = "^(Picture-in-Picture)$" },
    float = true,
    pin = true,
    no_initial_focus = true,
    size = "324 181",
    move = "(monitor_w-329) (monitor_h-212)",
    animation = "slide right",
    keep_aspect_ratio = true,
})

-- Special workspace
hl.workspace_rule({
    workspace = "special:magic",
    gaps_out = { top = 60, right = 150, bottom = 60, left = 150 },
    gaps_in = 15,
})
hl.window_rule({
    name = "magic-move",
    match = { workspace = "special:magic" },
    move = "10% 5%",
    size = "80% 50%",
})

-- Connectivity
hl.window_rule({
    name = "nmtui",
    match = { class = "^(nmtui)$" },
    float = true,
    size = "950 600",
    center = true,
})
hl.window_rule({
    name = "bluetui",
    match = { class = "^(bluetui)$" },
    float = true,
    size = "900 500",
    center = true,
})

-- Terminal modules
hl.window_rule({
    name = "update-terminal",
    match = { class = "^(update-terminal)$" },
    float = true,
    center = true,
    size = "1000 600",
})

-- Sushi
hl.window_rule({
    name = "sushi",
    match = { class = "^(org.gnome.NautilusPreviewer)$" },
    float = true,
    center = true,
    size = "800 600",
})

