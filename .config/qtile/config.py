"""Qtile configuration file"""

import os
import subprocess

from libqtile import hook, qtile, bar
from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile.layout.xmonad import MonadTall
from libqtile.layout.max import Max
from libqtile.layout.floating import Floating
from libqtile.lazy import lazy
from qtile_extras import widget
from qtile_extras.widget.decorations import RectDecoration
from colors import colors

# pylint: disable=invalid-name

MOD = "mod4"  # mod4 = super, mod1 = alt
TERMINAL = "kitty"

# keybindings
keys = [
    Key([MOD], "Return", lazy.spawn(TERMINAL), desc="Launch terminal"),
    Key(
        [MOD],
        "r",
        lazy.spawn("rofi -show drun -theme ~/.config/rofi/drun.rasi"),
        desc="Rofi Drun",
    ),
    Key([], "XF86AudioRaiseVolume", lazy.spawn("pactl set-sink-volume 0 +5%")),
    Key([], "XF86AudioLowerVolume", lazy.spawn("pactl set-sink-volume 0 -5%")),
    Key([], "XF86AudioMute", lazy.spawn("pactl set-sink-mute 0 toggle")),
    Key([], "XF86MonBrightnessUp", lazy.spawn("brightnessctl s 5%+")),
    Key([], "XF86MonBrightnessDown", lazy.spawn("brightnessctl s 5%-")),
    Key(
        [MOD, "shift"],
        "c",
        lazy.spawn(
            "rofi \
               -modi 'clipboard:greenclip print' \
               -show clipboard \
               -theme ~/.config/rofi/clipboard.rasi"
        ),
    ),
    Key([MOD, "shift"], "r", lazy.spawn(f"{TERMINAL} -e ranger")),
    Key([MOD, "shift"], "w", lazy.spawn("google-chrome-stable")),
    Key([MOD, "shift"], "p", lazy.spawn("firefox")),
    Key([MOD, "shift"], "n", lazy.spawn("nemo")),
    Key([MOD], "h", lazy.layout.left(), desc="Move focus to left"),
    Key([MOD], "l", lazy.layout.right(), desc="Move focus to right"),
    Key([MOD], "j", lazy.layout.down(), desc="Move focus down"),
    Key([MOD], "k", lazy.layout.up(), desc="Move focus up"),
    Key([MOD], "space", lazy.layout.next(), desc="Move window focus to other window"),
    Key(
        [MOD, "shift"], "h", lazy.layout.shuffle_left(), desc="Move window to the left"
    ),
    Key(
        [MOD, "shift"],
        "l",
        lazy.layout.shuffle_right(),
        desc="Move window to the right",
    ),
    Key([MOD, "shift"], "j", lazy.layout.shuffle_down(), desc="Move window down"),
    Key([MOD, "shift"], "k", lazy.layout.shuffle_up(), desc="Move window up"),
    Key([MOD, "control"], "h", lazy.layout.grow_left(), desc="Grow window to the left"),
    Key(
        [MOD, "control"], "l", lazy.layout.grow_right(), desc="Grow window to the right"
    ),
    Key([MOD, "control"], "j", lazy.layout.grow_down(), desc="Grow window down"),
    Key([MOD, "control"], "k", lazy.layout.grow_up(), desc="Grow window up"),
    Key([MOD], "n", lazy.layout.normalize(), desc="Reset all window sizes"),
    Key(
        [MOD, "shift"],
        "Return",
        lazy.layout.toggle_split(),
        desc="Toggle between split and unsplit sides of stack",
    ),
    Key([MOD], "Tab", lazy.next_layout(), desc="Toggle between layouts"),
    Key([MOD], "w", lazy.window.kill(), desc="Kill focused window"),
    Key([MOD], "f", lazy.window.toggle_fullscreen()),
    Key([MOD], "v", lazy.window.toggle_floating()),
    Key([MOD, "control"], "r", lazy.reload_config(), desc="Reload the config"),
    Key([MOD, "shift"], "q", lazy.shutdown(), desc="Shutdown Qtile"),
]

# groups
groups = [Group(f"{i+1}", label="󰏃") for i in range(6)]

for i in groups:
    keys.extend(
        [
            Key(
                [MOD],
                i.name,
                lazy.group[i.name].toscreen(),
                desc=f"Switch to group {i.name}",
            ),
            Key(
                [MOD, "shift"],
                i.name,
                lazy.window.togroup(i.name, switch_group=True),
                desc=f"Switch to & move focused window to group {i.name}",
            ),
        ]
    )

# layouts
layout_theme = {
    "margin": 12,
    "border_focus": colors["foreground"],
    "border_normal": colors["color0"],
}

layouts = [
    MonadTall(**layout_theme, border_width=4, single_border_width=4),
    Max(**layout_theme, border_width=4),
]

# widgets
widget_defaults = {
    "font": "CaskaydiaCove NFM Bold",
    "fontsize": 16,
    "padding": 20,
    "decorations": [
        RectDecoration(
            colour=colors["background"], radius=20, filled=True, line_width=4
        )
    ],
}

extension_defaults = widget_defaults.copy()

groupbox_config = {
    "borderwidth": 0,
    "margin_x": 24,
    "padding_x": 3,
    "active": colors["foreground"],
    "inactive": colors["color0"],
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

memory_config = {
    "format": "󰍛 {MemUsed:.0f}{mm}",
    "foreground": colors["color1"],
    "mouse_callbacks": {"Button1": lambda: qtile.cmd_spawn(f"{TERMINAL} -e btop")},
}

bluetooth_config = {
    "default_text": " 󰂯 {connected_devices}",
    "padding": 12,
    "default_show_battery": True,
    "device_battery_format": " {battery}% ",
    "mouse_callbacks": {"Button1": lambda: qtile.cmd_spawn("blueberry")},
    "decorations": [
        RectDecoration(colour=colors["color1"], radius=20, filled=True, line_width=4)
    ],
}

cpu_config = {
    "format": "󰘚 {load_percent}%",
    "foreground": colors["color3"],
    "mouse_callbacks": {"Button1": lambda: qtile.cmd_spawn(f"{TERMINAL} -e btop")},
}

pulse_volume_config = {"fmt": "󰕾 {}", "foreground": colors["color4"]}

net_config = {
    "format": "󰇚 {down:.2f}{down_suffix}",
    "foreground": colors["color6"],
    "mouse_callbacks": {"Button1": lambda: qtile.cmd_spawn(f"{TERMINAL} -e nmtui")},
}

spacer = {
    "decorations": [RectDecoration(colour=colors["transparent"], filled=False)],
}

separator = {
    "size_percent": 0,
    "padding": 10,
    "decorations": [RectDecoration(colour=colors["color0"])],
}

window_name_config = {
    "fmt": " {}",
    "width": 600,
    "decorations": [
        RectDecoration(
            colour=colors["color6"],
            radius=20,
            filled=True,
            line_width=4,
        )
    ],
}

clock_config = {"format": "󱑂 %I:%M", "foreground": colors["color4"]}

screens = [
    Screen(
        top=bar.Bar(
            [
                widget.Sep(**separator),
                widget.GroupBox(**groupbox_config),
                widget.Sep(**separator),
                widget.WindowName(**window_name_config),
                widget.Sep(**separator),
                widget.Spacer(**spacer),
                widget.Sep(**separator),
                widget.Net(**net_config),
                widget.Sep(**separator),
                widget.PulseVolume(**pulse_volume_config),
                widget.Sep(**separator),
                widget.Memory(**memory_config),
                widget.Sep(**separator),
                widget.CPU(**cpu_config),
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
            44,
            background=colors["transparent"],
            margin=[8, 0, 0, 0],
        )
    ),
]

# floating layout
mouse = [
    Drag(
        [MOD],
        "Button1",
        lazy.window.set_position_floating(),
        start=lazy.window.get_position(),
    ),
    Drag(
        [MOD], "Button3", lazy.window.set_size_floating(), start=lazy.window.get_size()
    ),
    Click([MOD], "Button2", lazy.window.bring_to_front()),
]

dgroups_key_binder = None
dgroups_app_rules = []
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
    border_focus=colors["color5"],
    border_normal=colors["color0"],
)

auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True
auto_minimize = True


# autostart
@hook.subscribe.startup_once
def autostart():
    """Execute autostart script on Qtile startup."""
    script = os.path.expanduser("~/.config/qtile/autostart.sh")
    subprocess.run([script], check=True)


wmname = "LG3D"
