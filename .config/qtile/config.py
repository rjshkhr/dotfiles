import os
import json
import subprocess

from libqtile import hook, qtile, bar, widget
from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile.layout.xmonad import MonadTall
from libqtile.layout.max import Max
from libqtile.layout.floating import Floating
from libqtile.lazy import lazy

mod = "mod4"  # mod4 = super, mod1 = alt
terminal = "kitty"

# keybindings
keys = [
    Key([mod], "Return", lazy.spawn(terminal), desc="Launch terminal"),
    Key([mod], "d", lazy.spawn("dm_run"), desc="Dmenu run"),
    Key([], "XF86AudioRaiseVolume", lazy.spawn("pactl set-sink-volume 0 +5%")),
    Key([], "XF86AudioLowerVolume", lazy.spawn("pactl set-sink-volume 0 -5%")),
    Key([], "XF86AudioMute", lazy.spawn("pactl set-sink-mute 0 toggle")),
    Key([mod, "mod1"], "n", lazy.spawn("pactl set-sink-volume 0 +5%")),
    Key([mod, "mod1"], "p", lazy.spawn("pactl set-sink-volume 0 -5%")),
    Key([mod, "mod1"], "m", lazy.spawn("pactl set-sink-mute 0 toggle")),
    Key([], "XF86MonBrightnessUp", lazy.spawn("brightnessctl s 5%+")),
    Key([], "XF86MonBrightnessDown", lazy.spawn("brightnessctl s 5%-")),
    Key([], "Print", lazy.spawn("flameshot gui")),
    Key([mod, "shift"], "p", lazy.spawn("flameshot gui")),
    Key([mod, "shift"], "c", lazy.spawn("dm_greenclip")),
    Key([mod, "shift"], "s", lazy.spawn("dm_power")),
    Key([mod, "shift"], "r", lazy.spawn(f"{terminal} -e ranger")),
    Key(
        [mod, "mod1"],
        "d",
        lazy.spawn("google-chrome-stable --profile-directory=Default"),
    ),
    Key(
        [mod, "mod1"],
        "w",
        lazy.spawn('google-chrome-stable --profile-directory="Profile 2"'),
    ),
    Key([mod], "h", lazy.layout.left(), desc="Move focus to left"),
    Key([mod], "l", lazy.layout.right(), desc="Move focus to right"),
    Key([mod], "j", lazy.layout.down(), desc="Move focus down"),
    Key([mod], "k", lazy.layout.up(), desc="Move focus up"),
    Key([mod], "space", lazy.layout.next(), desc="Move window focus to other window"),
    Key(
        [mod, "shift"], "h", lazy.layout.shuffle_left(), desc="Move window to the left"
    ),
    Key(
        [mod, "shift"],
        "l",
        lazy.layout.shuffle_right(),
        desc="Move window to the right",
    ),
    Key([mod, "shift"], "j", lazy.layout.shuffle_down(), desc="Move window down"),
    Key([mod, "shift"], "k", lazy.layout.shuffle_up(), desc="Move window up"),
    Key([mod, "control"], "h", lazy.layout.grow_left(), desc="Grow window to the left"),
    Key(
        [mod, "control"], "l", lazy.layout.grow_right(), desc="Grow window to the right"
    ),
    Key([mod, "control"], "j", lazy.layout.grow_down(), desc="Grow window down"),
    Key([mod, "control"], "k", lazy.layout.grow_up(), desc="Grow window up"),
    Key([mod], "n", lazy.layout.normalize(), desc="Reset all window sizes"),
    Key(
        [mod, "shift"],
        "Return",
        lazy.layout.toggle_split(),
        desc="Toggle between split and unsplit sides of stack",
    ),
    Key([mod], "Tab", lazy.next_layout(), desc="Toggle between layouts"),
    Key([mod], "w", lazy.window.kill(), desc="Kill focused window"),
    Key([mod], "f", lazy.window.toggle_fullscreen()),
    Key([mod], "t", lazy.window.toggle_floating()),
    Key([mod, "control"], "r", lazy.reload_config(), desc="Reload the config"),
    Key([mod, "control"], "q", lazy.shutdown(), desc="Shutdown Qtile"),
    Key([mod], "r", lazy.spawncmd(), desc="Spawn a command using a prompt widget"),
]

# groups
groups = [Group(f"{i+1}", label="󰏃") for i in range(6)]

for i in groups:
    keys.extend(
        [
            Key(
                [mod],
                i.name,
                lazy.group[i.name].toscreen(),
                desc="Switch to group {}".format(i.name),
            ),
            Key(
                [mod, "shift"],
                i.name,
                lazy.window.togroup(i.name, switch_group=True),
                desc="Switch to & move focused window to group {}".format(i.name),
            ),
        ]
    )

# pywal colors
colors_json = os.path.expanduser("~/.cache/wal/colors.json")
colors = json.load(open(colors_json))["colors"]

# layouts
layout_theme = {
    "margin": 24,
    "border_focus": colors["color7"],
    "border_normal": colors["color0"],
    "border_on_single": True,
}

layouts = [
    MonadTall(**layout_theme, border_width=4, single_border_width=4),
    Max(**layout_theme, border_width=0),
]

# widgets
widget_defaults = dict(
    font="IosevkaTerm NF Bold",
    fontsize=18,
    padding_x=0,
)

extension_defaults = widget_defaults.copy()

groupbox_config = {
    "highlight_method": "block",
    "spacing": 9,
    "padding_x": 9,
    "borderwidth": 3,
    "active": colors["color5"],
    "inactive": colors["color8"],
    "this_current_screen_border": colors["color0"],
    "other_current_screen_border": colors["color0"],
    "other_screen_border": colors["color0"],
    "this_screen_border": colors["color0"],
    "urgent_border": colors["color0"],
    "block_highlight_text_color": colors["color4"],
    "disable_drag": True,
}

battery_config = {
    "charge_char": "󰂄",
    "discharge_char": "󰁹",
    "empty_char": "󰂃",
    "full_char": "󰁹",
    "not_charging_char": "󰁹",
    "format": "{char} {percent:2.0%}",
    "foreground": colors["color2"],
}

backlight_config = {
    "fmt": "󰌵 {}",
    "foreground": colors["color5"],
    "backlight_name": "nvidia_wmi_ec_backlight",
}

check_updates_config = {
    "distro": "Arch",
    "fmt": "󰏕 {}",
    "initial_text": "0",
    "update_interval": 1800,
    "display_format": "{updates}",
    "foreground": colors["color6"],
    "colour_have_updates": colors["color6"],
    "colour_no_updates": colors["color6"],
    "no_update_string": "0",
    "mouse_callbacks": {
        "Button1": lambda: qtile.cmd_spawn(
            f"{terminal} -e sh -c 'paru -Syu && exec bash'"
        )
    },
}

memory_config = {
    "format": "󰍛 {MemUsed:.0f}{mm}",
    "foreground": colors["color1"],
    "mouse_callbacks": {"Button1": lambda: qtile.cmd_spawn(f"{terminal} -e htop")},
}

bluetooth_config = {
    "foreground": colors["color8"],
    "default_text": "󰂯 {connected_devices}",
    "default_show_battery": True,
    "device_battery_format": " {battery}%",
    "mouse_callbacks": {"Button1": lambda: qtile.cmd_spawn("blueberry")},
}

cpu_config = {
    "format": "󰘚 {load_percent}%",
    "foreground": colors["color3"],
    "mouse_callbacks": {"Button1": lambda: qtile.cmd_spawn(f"{terminal} -e htop")},
}

pulse_volume_config = {"fmt": "󰕾 {}", "foreground": colors["color4"]}

net_config = {
    "format": "󰇚 {down:.2f}{down_suffix}",
    "foreground": colors["color8"],
    "mouse_callbacks": {"Button1": lambda: qtile.cmd_spawn(f"{terminal} -e nmtui")},
}

separator = {"size_percent": 0, "padding": 9}
current_layout_config = {"fmt": "  {}", "foreground": colors["color3"]}
clock_config = {"format": "󱑂  %I:%M", "foreground": colors["color4"]}

screens = [
    Screen(
        top=bar.Bar(
            [
                widget.Sep(**separator),
                widget.GroupBox(**groupbox_config),
                widget.Sep(**separator),
                widget.CurrentLayout(**current_layout_config),
                widget.Sep(**separator),
                widget.Prompt(),
                widget.Spacer(),
                widget.Sep(**separator),
                widget.Systray(),
                widget.Sep(**separator),
                widget.Net(**net_config),
                widget.Sep(**separator),
                widget.PulseVolume(**pulse_volume_config),
                widget.Sep(**separator),
                widget.Memory(**memory_config),
                widget.Sep(**separator),
                widget.CPU(**cpu_config),
                widget.Sep(**separator),
                widget.CheckUpdates(**check_updates_config),
                widget.Sep(**separator),
                widget.Backlight(**backlight_config),
                widget.Sep(**separator),
                widget.Battery(**battery_config),
                widget.Sep(**separator),
                widget.Clock(**clock_config),
                widget.Sep(**separator),
                widget.Bluetooth(**bluetooth_config),
                widget.Sep(**separator),
            ],
            48,
            background=colors["color0"],
            opacity=1,
        )
    ),
]

# floating layout
mouse = [
    Drag(
        [mod],
        "Button1",
        lazy.window.set_position_floating(),
        start=lazy.window.get_position(),
    ),
    Drag(
        [mod], "Button3", lazy.window.set_size_floating(), start=lazy.window.get_size()
    ),
    Click([mod], "Button2", lazy.window.bring_to_front()),
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: list
follow_mouse_focus = True
bring_front_click = False
floats_kept_above = True
cursor_warp = False

floating_layout = Floating(
    float_rules=[
        *Floating.default_float_rules,
        Match(wm_class="confirmreset"),  # gitk
        Match(wm_class="makebranch"),  # gitk
        Match(wm_class="maketag"),  # gitk
        Match(wm_class="ssh-askpass"),  # ssh-askpass
        Match(title="branchdialog"),  # gitk
        Match(wm_class="feh"),
    ],
    border_width=4,
    border_focus=colors["color7"],
    border_normal=colors["color0"],
)

auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True
auto_minimize = True


# autostart
@hook.subscribe.startup_once
def autostart():
    script = os.path.expanduser("~/.config/qtile/autostart.sh")
    subprocess.run([script])


wmname = "LG3D"
