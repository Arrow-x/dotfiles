-- Hyprland Lua Configuration
-- Converted from hyprland.conf for Hyprland v0.55+ Lua configuration system.
-- Official Documentation: https://wiki.hypr.land/Configuring/Start/

local home = os.getenv("HOME") or ""

--------------------------------------------------------------------------------
-- Program Shortcuts & Variables
--------------------------------------------------------------------------------
local terminal = "kitty --single-instance"
local terminal_with_title = "kitty --single-instance --app-id"
local browser = "brave-origin"
local mainMod = "SUPER"

--------------------------------------------------------------------------------
-- Monitors Configuration
--------------------------------------------------------------------------------
if not pcall(require, "monitors") then
	hl.monitor({
		output = "HDMI-A-1",
		mode = "1920x1080@165.0",
		position = "0x0",
		scale = "1.0",
		bitdepth = 10,
	})
end

--------------------------------------------------------------------------------
-- General Configuration Settings
--------------------------------------------------------------------------------
hl.config({
	ecosystem = {
		no_update_news = true,
	},

	input = {
		kb_options = "caps:swapescape,grp:alt_shift_toggle",
		kb_layout = "us,ara",
		-- repeat_delay = 400,
		-- repeat_rate = 35,
		numlock_by_default = true,
		follow_mouse = 2,
		touchpad = {
			natural_scroll = true,
		},
		sensitivity = 0, -- -1.0 - 1.0, 0 means no modification.
	},

	general = {
		gaps_in = 2,
		gaps_out = 2,
		border_size = 2,
		col = {
			active_border = "0xffb4befe",
			inactive_border = "0xff45475a",
		},
		layout = "master",
		no_focus_fallback = false,
	},

	decoration = {
		rounding = 5,
		shadow = {
			enabled = true,
			range = 4,
			render_power = 3,
			color = "rgba(1a1a1aee)",
		},
		blur = {
			enabled = false,
		},
	},

	animations = {
		enabled = true,
	},

	dwindle = {
		preserve_split = true,
	},

	master = {
		new_status = "master",
		new_on_top = true,
		orientation = "left",
		mfact = 0.8,
	},

	misc = {
		disable_hyprland_logo = true,
	},
})

--------------------------------------------------------------------------------
-- Curves and Animations
--------------------------------------------------------------------------------
hl.curve("md3_decel", { type = "bezier", points = { { 0.05, 0.7 }, { 0.1, 1 } } })

hl.animation({ leaf = "windowsIn", enabled = true, speed = 6, bezier = "md3_decel", style = "slide" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 6, bezier = "md3_decel", style = "slide" })
hl.animation({ leaf = "windowsMove", enabled = true, speed = 6, bezier = "md3_decel", style = "slide" })
hl.animation({ leaf = "fade", enabled = true, speed = 10, bezier = "md3_decel" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 7, bezier = "md3_decel", style = "slide" })
hl.animation({ leaf = "specialWorkspace", enabled = true, speed = 8, bezier = "md3_decel", style = "slide" })

--------------------------------------------------------------------------------
-- Workspace Rules
--------------------------------------------------------------------------------
hl.workspace_rule({
	workspace = "w[tv1]",
	gaps_in = 0,
	gaps_out = 0,
})

hl.workspace_rule({
	workspace = "f[1]",
	gaps_in = 0,
	gaps_out = 0,
})

--------------------------------------------------------------------------------
-- Environment Variables
--------------------------------------------------------------------------------
hl.env("XDG_CURRENT_DESKTOP", "Hyprland")
hl.env("XDG_SESSION_TYPE", "wayland")
hl.env("XDG_SESSION_DESKTOP", "Hyprland")

--------------------------------------------------------------------------------
-- Autostart Applications
--------------------------------------------------------------------------------
hl.on("hyprland.start", function()
	hl.exec_cmd("/usr/bin/snapshot-detect")
	hl.exec_cmd("/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1")
	hl.exec_cmd("systemctl --user import-environment DISPLAY WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
	hl.exec_cmd(
		"hash dbus-update-activation-environment 2>/dev/null && dbus-update-activation-environment --systemd DISPLAY WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
	)
	hl.exec_cmd("waybar")
	hl.exec_cmd("nm-applet --indicator")
	hl.exec_cmd("dunst --config " .. home .. "/.config/dunst/dunstrc")
	hl.exec_cmd("wl-paste --watch cliphist store")
	hl.exec_cmd("wlsunset -l 36.736647 -L 3.100180")
	hl.exec_cmd("foot -s")
	hl.exec_cmd("sway-audio-idle-inhibit")
	hl.exec_cmd("ideling.sh")
	hl.exec_cmd("eos-update-notifier")
	hl.exec_cmd("otd-daemon")
	hl.exec_cmd("wljoywake")
	hl.exec_cmd(home .. "/.local/bin/current_bg")
	hl.exec_cmd(home .. "/.local/bin/binger")
end)

--------------------------------------------------------------------------------
-- Window Rules
--------------------------------------------------------------------------------
hl.window_rule({ match = { float = false, workspace = "w[tv1]" }, border_size = 0, rounding = 0 })
hl.window_rule({ match = { float = false, workspace = "f[1]" }, border_size = 0, rounding = 0 })

hl.window_rule({ match = { class = ".*" }, persistent_size = true })

hl.window_rule({ match = { class = "^(t_newsraft)$" }, float = true, size = "1400 900", center = true })
hl.window_rule({ match = { class = "^(t_cmus)$" }, float = true, size = "1400 900" })
hl.window_rule({ match = { class = "^(deadbeef)$" }, float = true, size = "1400 900", center = true })
hl.window_rule({ match = { class = "^(t_lf)$" }, float = true, size = "1400 900" })
hl.window_rule({ match = { class = "^(t_yazi)$" }, float = true, size = "1400 900", center = true })
hl.window_rule({ match = { class = "^(t_btop)$" }, float = true, size = "1400 900", center = true })
hl.window_rule({ match = { class = "^(t_cht.sh)$" }, float = true, size = "1400 900", center = true })
hl.window_rule({ match = { class = "^(t_shit_poster)$" }, float = true, size = "1400 900", center = true })
hl.window_rule({
	match = { class = "^(org.godotengine.ProjectManager)$" },
	float = true,
	size = "1400 900",
	center = true,
})

hl.window_rule({ match = { class = "^(Godot|org.godotengine.Editor)$" }, float = false, tile = true })
hl.window_rule({ match = { class = "^(t_drop)$" }, float = true, size = "1910 500", move = "5 2" })
hl.window_rule({ match = { class = "^(t_fzf_menu)$" }, float = true, size = "1910 500", move = "5 2" })
hl.window_rule({ match = { class = "^(galculator)$" }, float = true, size = "406 355", center = true })
hl.window_rule({ match = { class = "^(Nsxiv)$" }, tile = true })

hl.window_rule({ match = { class = "^(footclient|kitty)$" }, workspace = "1" })
-- hl.window_rule({ match = { class = "^(mpv)$" }, workspace = "2" })
hl.window_rule({
	match = { class = "^((Chromium|firefox|librewolf|[Bb]rave-browser|brave-origin))(.*)$" },
	workspace = "3",
})
hl.window_rule({ match = { class = "^(org.godotengine.(ProjectManager|Editor)|Godot)$" }, workspace = "4" })
hl.window_rule({ match = { class = "^([bB]lender|bforartists)$" }, workspace = "7" })
hl.window_rule({ match = { class = "^([kK]rita)$" }, workspace = "8" })
hl.window_rule({ match = { class = "^(pcmanfm|io.elementary.files|nemo)$" }, workspace = "9" })

--------------------------------------------------------------------------------
-- Keybindings
--------------------------------------------------------------------------------
-- Media & Hardware Keys
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl -q set 3%+"))
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl --min-val=2 -q set 3%-"))
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd(home .. "/.local/bin/pl_dmenu prev"))
hl.bind("XF86AudioNext", hl.dsp.exec_cmd(home .. "/.local/bin/pl_dmenu next"))
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd(home .. "/.local/bin/pl_dmenu play-pause"))
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"))
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"))
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"))
hl.bind("XF86HomePage", hl.dsp.exec_cmd(browser))
hl.bind("Print", hl.dsp.exec_cmd("printf 'window\\noutput\\nregion' | fuzzel --dmenu | xargs hyprshot -m"))
hl.bind("SHIFT + Print", hl.dsp.exec_cmd("hyprshot -z -m output -m HDMI-A-1"))

-- General Window & Group Binds
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen())
hl.bind(mainMod .. " + CONTROL + SPACE", hl.dsp.layout("swapwithmaster master"))
hl.bind(mainMod .. " + SHIFT + SPACE", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + C", hl.dsp.window.close())
hl.bind(mainMod .. " + E", hl.dsp.group.toggle())

hl.bind(mainMod .. " + Y", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"))
hl.bind(mainMod .. " + SHIFT + Y", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"))
hl.bind(mainMod .. " + CONTROL + Y", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"))

hl.bind(mainMod .. " + X", hl.dsp.exec_cmd("killall -SIGUSR1 waybar"))
hl.bind(
	mainMod .. " + SPACE",
	hl.dsp.exec_cmd("rofi -show window -config " .. home .. "/.config/rofi/arc_dark_colors.rasi")
)
hl.bind(mainMod .. " + D", hl.dsp.exec_cmd("fuzzel --list-executables-in-path"))
hl.bind(mainMod .. " + RETURN", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + W", hl.dsp.exec_cmd(browser))
hl.bind(mainMod .. " + SHIFT + M", hl.dsp.exec_cmd(home .. "/.local/bin/monset"))
-- hl.bind(mainMod .. " + SHIFT + N", hl.dsp.exec_cmd("io.elementary.files"))
hl.bind(mainMod .. " + SHIFT + N", hl.dsp.exec_cmd("$FILEMANAGER"))

hl.bind(mainMod .. " + R", hl.dsp.exec_cmd("hyprun t_newsraft -- " .. terminal_with_title .. " t_newsraft newsraft"))
hl.bind(mainMod .. " + SEMICOLON", hl.dsp.exec_cmd("hyprun deadbeef"))
hl.bind(mainMod .. " + APOSTROPHE", hl.dsp.exec_cmd("hyprun t_btop -- " .. terminal_with_title .. " t_btop btop"))
hl.bind(mainMod .. " + TAB", hl.dsp.exec_cmd("hyprun t_drop -- " .. terminal_with_title .. " t_drop"))
hl.bind(mainMod .. " + n", hl.dsp.exec_cmd("hyprun t_yazi -- " .. terminal_with_title .. " t_yazi yazi"))
hl.bind(mainMod .. " + M", hl.dsp.exec_cmd("hyprun t_cht.sh -- " .. terminal_with_title .. " t_cht.sh cht.sh"))

hl.bind(mainMod .. " + u", hl.dsp.exec_cmd(home .. "/.local/bin/pl_dmenu play-pause"))
hl.bind(mainMod .. " + SHIFT + U", hl.dsp.exec_cmd(home .. "/.local/bin/pl_dmenu stop"))
hl.bind(mainMod .. " + BRACKETRIGHT", hl.dsp.exec_cmd(home .. "/.local/bin/pl_dmenu next"))
hl.bind(mainMod .. " + BRACKETLEFT", hl.dsp.exec_cmd(home .. "/.local/bin/pl_dmenu previous"))

hl.bind(mainMod .. " + p", hl.dsp.exec_cmd(home .. "/.local/bin/trackpad"))
hl.bind(mainMod .. " + SHIFT + P", hl.dsp.exec_cmd(home .. "/.local/bin/lock.sh"))
hl.bind(mainMod .. " + v", hl.dsp.exec_cmd("paster"))

hl.bind(mainMod .. " + b", hl.dsp.exec_cmd(home .. "/.local/bin/select_bookmark --browser"))
hl.bind(mainMod .. " + SHIFT + B", hl.dsp.exec_cmd(home .. "/.local/bin/bookmark"))

hl.bind(mainMod .. " + q", hl.dsp.exec_cmd("clipboard_download --view"))
hl.bind(mainMod .. " + SHIFT + Q", hl.dsp.exec_cmd("clipboard_download --download"))

hl.bind(mainMod .. " + o", hl.dsp.exec_cmd("proj --neovim"))
hl.bind(mainMod .. " + SHIFT + O", hl.dsp.exec_cmd("proj --change-dir"))
hl.bind(mainMod .. " + CONTROL + O", hl.dsp.exec_cmd("proj --local-configs"))
hl.bind(mainMod .. " + CONTROL + SHIFT + O", hl.dsp.exec_cmd("proj --Local-configs-dir"))

hl.bind(mainMod .. " + i", hl.dsp.exec_cmd(home .. "/.local/bin/unicode_menu --emoji"))
hl.bind(mainMod .. " + SHIFT + I", hl.dsp.exec_cmd(home .. "/.local/bin/unicode_menu --nerdfont"))

hl.bind(mainMod .. " + s", hl.dsp.exec_cmd("bitwarden-desktop"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.exec_cmd(home .. "/.local/bin/pass_menu --pass"))

-- Native Focus Binds
hl.bind(mainMod .. " + l", hl.dsp.focus({ direction = "r" }))
hl.bind(mainMod .. " + h", hl.dsp.focus({ direction = "l" }))
hl.bind(mainMod .. " + k", hl.dsp.focus({ direction = "u" }))
hl.bind(mainMod .. " + j", hl.dsp.focus({ direction = "d" }))

-- Native Group Focus Binds
hl.bind(mainMod .. " + L", hl.dsp.group.next())
hl.bind(mainMod .. " + H", hl.dsp.group.prev())

-- Native Workspace & Window Movement Binds
local workspaces = {
	{ key = "1", target = "1" },
	{ key = "2", target = "2" },
	{ key = "3", target = "3" },
	{ key = "4", target = "4" },
	{ key = "5", target = "5" },
	{ key = "6", target = "6" },
	{ key = "7", target = "7" },
	{ key = "8", target = "8" },
	{ key = "9", target = "9" },
	{ key = "0", target = "10" },
	{ key = "KP_End", target = "1" },
	{ key = "KP_Down", target = "2" },
	{ key = "KP_Next", target = "3" },
	{ key = "KP_Left", target = "4" },
	{ key = "KP_Begin", target = "5" },
	{ key = "KP_Right", target = "6" },
	{ key = "KP_Home", target = "7" },
	{ key = "KP_Up", target = "8" },
	{ key = "KP_Prior", target = "9" },
	{ key = "KP_Insert", target = "10" },
}

for _, ws in ipairs(workspaces) do
	hl.bind(mainMod .. " + " .. ws.key, hl.dsp.focus({ workspace = ws.target }))
	hl.bind(mainMod .. " + SHIFT + " .. ws.key, hl.dsp.window.move({ workspace = ws.target }))
end

hl.bind(mainMod .. " + CONTROL + L", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + CONTROL + H", hl.dsp.focus({ workspace = "e-1" }))

-- Native Window Directional Move Binds
hl.bind(mainMod .. " + SHIFT + L", hl.dsp.window.move({ direction = "r" }))
hl.bind(mainMod .. " + SHIFT + H", hl.dsp.window.move({ direction = "l" }))
hl.bind(mainMod .. " + SHIFT + K", hl.dsp.window.move({ direction = "u" }))
hl.bind(mainMod .. " + SHIFT + J", hl.dsp.window.move({ direction = "d" }))

-- Native Window Resize Binds
hl.bind(mainMod .. " + ALT + L", hl.dsp.window.resize({ x = 80, y = 0, relative = true }))
hl.bind(mainMod .. " + ALT + H", hl.dsp.window.resize({ x = -80, y = 0, relative = true }))
hl.bind(mainMod .. " + ALT + K", hl.dsp.window.resize({ x = 0, y = -80, relative = true }))
hl.bind(mainMod .. " + ALT + J", hl.dsp.window.resize({ x = 0, y = 80, relative = true }))

-- Native Mouse Binds
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }), { mouse = true })
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }), { mouse = true })

hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true, drag = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })
