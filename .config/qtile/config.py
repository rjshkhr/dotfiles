"""Qtile configuration file"""

import os
import subprocess

from libqtile import bar, layout, qtile, hook
from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile.lazy import lazy
from qtile_extras import widget
from qtile_extras.widget.decorations import RectDecoration
from colors import colors

# pylint: disable=invalid-name

mod = "mod4"
terminal = "kitty"
widget_radius = 18


@lazy.function
def center_floating_window(qtile_instance):
    """Center the current floating window on the screen.

    Args:
        qtile_instance: The Qtile instance object
    """

    window = qtile_instance.current_window
    if window and window.floating:
        window.center()


keys = [
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
    Key([mod], "Return", lazy.spawn(terminal), desc="Launch terminal"),
    Key([], "XF86AudioRaiseVolume", lazy.spawn("pactl set-sink-volume 0 +5%")),
    Key([], "XF86AudioLowerVolume", lazy.spawn("pactl set-sink-volume 0 -5%")),
    Key([], "XF86AudioMute", lazy.spawn("pactl set-sink-mute 0 toggle")),
    Key([], "XF86MonBrightnessUp", lazy.spawn("brightnessctl s 5%+")),
    Key([], "XF86MonBrightnessDown", lazy.spawn("brightnessctl s 5%-")),
    Key([], "Print", lazy.spawn("flameshot gui")),
    Key([mod], "Tab", lazy.next_layout(), desc="Toggle between layouts"),
    Key([mod], "w", lazy.window.kill(), desc="Kill focused window"),
    Key(
        [mod],
        "f",
        lazy.window.toggle_fullscreen(),
        desc="Toggle fullscreen on the focused window",
    ),
    Key(
        [mod],
        "t",
        lazy.window.toggle_floating(),
        desc="Toggle floating on the focused window",
    ),
    Key([mod, "control"], "r", lazy.reload_config(), desc="Reload the config"),
    Key([mod, "shift"], "q", lazy.shutdown(), desc="Shutdown Qtile"),
    Key(
        [mod], "r", lazy.spawn("rofi -show drun -p '' -theme ~/.config/rofi/drun.rasi")
    ),
    Key([mod, "shift"], "n", lazy.spawn("nemo")),
    Key([mod, "shift"], "r", lazy.spawn(f"{terminal} -e ranger"), desc="Open ranger"),
    Key(
        [mod, "shift"],
        "c",
        center_floating_window,
        desc="Center floating window",
    ),
    Key([mod, "mod1"], "w", lazy.spawn("google-chrome-stable")),
    Key([mod, "mod1"], "p", lazy.spawn("firefox")),
    Key([mod, "mod1"], "s", lazy.spawn(os.path.expanduser("~/.local/bin/powermenu"))),
    Key([mod, "mod1"], "l", lazy.spawn(os.path.expanduser("~/.local/bin/lock"))),
    Key(
        [mod, "mod1"],
        "c",
        lazy.spawn(
            "rofi -modi 'clipboard:greenclip print' -theme  ~/.config/rofi/clipboard.rasi "
            + "-show clipboard"
        ),
    ),
    Key(
        [mod, "mod1"],
        "n",
        lazy.spawn("networkmanager_dmenu -theme ~/.config/rofi/networkmenu.rasi"),
    ),
]

for vt in range(1, 8):
    keys.append(
        Key(
            ["control", "mod1"],
            f"f{vt}",
            lazy.core.change_vt(vt).when(func=lambda: qtile.core.name == "wayland"),
            desc=f"Switch to VT{vt}",
        )
    )


groups = [
    Group(i[0], label=i[1])
    for i in [("1", ""), ("2", "󰈹"), ("3", ""), ("4", "󰉋"), ("5", "󰭹"), ("6", "󰣇")]
]

for i in groups:
    keys.extend(
        [
            Key(
                [mod],
                i.name,
                lazy.group[i.name].toscreen(),
                desc=f"Switch to group {i.name}",
            ),
            Key(
                [mod, "shift"],
                i.name,
                lazy.window.togroup(i.name, switch_group=True),
                desc=f"Switch to & move focused window to group {i.name}",
            ),
        ]
    )

layouts = [
    layout.MonadTall(
        border_width=4,
        single_border_width=0,
        margin=8,
        border_focus=colors["color7"],
        border_normal=colors["color8"],
    ),
    layout.Max(margin=8),
]

widget_defaults = {
    "font": "CaskaydiaCove NF Bold",
    "fontsize": 16,
    "padding": 20,
}

extension_defaults = widget_defaults.copy()


def get_backlight_device():
    """
    Detects and returns the first available backlight device.

    Returns:
        str: The name of the first available backlight device.
        None: If no backlight device is found.
    """
    backlight_dir = "/sys/class/backlight"
    if os.path.isdir(backlight_dir):
        devices = os.listdir(backlight_dir)
        if len(devices) > 0:
            return devices[0]
    return None


def get_wireless_interface():
    """
    Dynamically detect the wireless network interface.

    Returns:
        str: Name of the wireless network interface.
    """
    result = subprocess.run(["ip", "link"], capture_output=True, text=True, check=True)
    for line in result.stdout.split("\n"):
        if "wlan" in line or "wlp" in line:
            return line.split(":")[1].strip()
    return "wlan0"


sep_config = {
    "size_percent": 0,
    "padding": 8,
}

screens = [
    Screen(
        top=bar.Bar(
            [
                widget.TextBox(
                    text="󰀻",
                    foreground=colors["background"],
                    mouse_callbacks={
                        "Button1": lambda: qtile.cmd_spawn(
                            "rofi -show drun -p '' -theme ~/.config/rofi/drun.rasi"
                        )
                    },
                    decorations=[
                        RectDecoration(
                            colour=colors["color4"],
                            radius=widget_radius,
                            filled=True,
                        )
                    ],
                ),
                widget.Sep(**sep_config),
                widget.TextBox(
                    text="󰖯",
                    foreground=colors["background"],
                    mouse_callbacks={
                        "Button1": lambda: qtile.cmd_spawn(
                            "rofi -show window -p '' -theme ~/.config/rofi/window.rasi"
                        )
                    },
                    decorations=[
                        RectDecoration(
                            colour=colors["color6"],
                            radius=widget_radius,
                            filled=True,
                        )
                    ],
                ),
                widget.Sep(**sep_config),
                widget.GroupBox(
                    borderwidth=0,
                    block_highlight_text_color=colors["color3"],
                    active=colors["foreground"],
                    inactive=colors["color8"],
                    disable_drag=True,
                    radius=True,
                    padding_x=0,
                    margin_x=28,
                    decorations=[
                        RectDecoration(
                            colour=colors["background"],
                            radius=widget_radius,
                            filled=True,
                        )
                    ],
                ),
                widget.Prompt(foreground=colors["color8"]),
                widget.Spacer(),
                widget.Memory(
                    format="󰍛 {MemUsed:.0f}{mm}",
                    decorations=[
                        RectDecoration(
                            colour=colors["background"],
                            radius=widget_radius,
                            filled=True,
                        )
                    ],
                    foreground=colors["color5"],
                ),
                widget.Sep(**sep_config),
                widget.CPU(
                    format="󰘚 {load_percent}%",
                    decorations=[
                        RectDecoration(
                            colour=colors["background"],
                            radius=widget_radius,
                            filled=True,
                        )
                    ],
                    foreground=colors["color6"],
                ),
                widget.Sep(**sep_config),
                widget.Battery(
                    format="{char} {percent:2.0%}",
                    charge_char="󰂄",
                    discharge_char="󰁹",
                    empty_char="󰂃",
                    full_char="󰁹",
                    show_short_text=False,
                    not_charging_char="󰁹",
                    decorations=[
                        RectDecoration(
                            colour=colors["background"],
                            radius=widget_radius,
                            filled=True,
                        )
                    ],
                    foreground=colors["color2"],
                ),
                widget.Sep(**sep_config),
                widget.Backlight(
                    fmt="󰃚 {}",
                    backlight_name=get_backlight_device(),
                    decorations=[
                        RectDecoration(
                            colour=colors["background"],
                            radius=widget_radius,
                            filled=True,
                        )
                    ],
                    foreground=colors["color3"],
                ),
                widget.Sep(**sep_config),
                widget.Clock(
                    format="󰥔 %I:%M",
                    decorations=[
                        RectDecoration(
                            colour=colors["background"],
                            radius=widget_radius,
                            filled=True,
                        )
                    ],
                    foreground=colors["color4"],
                ),
                widget.Sep(**sep_config),
                widget.Wlan(
                    fmt="  {}",
                    format="{essid}",
                    interface=get_wireless_interface(),
                    foreground=colors["background"],
                    mouse_callbacks={
                        "Button1": lambda: qtile.cmd_spawn(
                            "networkmanager_dmenu -theme ~/.config/rofi/networkmenu.rasi"
                        )
                    },
                    decorations=[
                        RectDecoration(
                            colour=colors["color2"],
                            radius=widget_radius,
                            filled=True,
                        )
                    ],
                ),
                widget.Sep(**sep_config),
                widget.TextBox(
                    text="󰐥",
                    foreground=colors["background"],
                    mouse_callbacks={
                        "Button1": lambda: qtile.cmd_spawn(
                            os.path.expanduser("~/.local/bin/powermenu")
                        )
                    },
                    decorations=[
                        RectDecoration(
                            colour=colors["color1"],
                            radius=widget_radius,
                            filled=True,
                        )
                    ],
                ),
            ],
            42,
            background="#00000000",
            border_color="#00000000",
            border_width=[8, 8, 0, 8],
        ),
    ),
]

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
dgroups_app_rules = []
follow_mouse_focus = True
bring_front_click = False
floats_kept_above = True
cursor_warp = False

floating_layout = layout.Floating(
    float_rules=[
        *layout.Floating.default_float_rules,
        Match(wm_class="feh"),
        Match(wm_class="pavucontrol"),
        Match(wm_class="nwg-look"),
        Match(wm_class="blueberry.py"),
    ],
    border_width=0,
)

auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True
auto_minimize = True

wl_input_rules = None
wl_xcursor_theme = "Bibata-Modern-Ice"
wl_xcursor_size = 32


@hook.subscribe.startup_once
def autostart():
    """Execute autostart script on Qtile startup."""
    script = os.path.expanduser("~/.config/qtile/autostart.sh")
    subprocess.run([script], check=True)


wmname = "LG3D"
