from libqtile.config import Key, Screen, Group, Drag, Click
from libqtile.command import lazy
from libqtile import layout, bar, widget

mod = "mod4"

keys = [
    # Switch between windows in current stack pane
    Key(
        [mod], "k",
        lazy.layout.down()
    ),
    Key(
        [mod], "j",
        lazy.layout.up()
    ),
    Key(
        [mod], "h",
        lazy.layout.left()
    ),
    Key(
        [mod], "l",
        lazy.layout.right()
    ),
    Key(
        [mod, "shift"], "k",
        lazy.layout.shuffle_up()
    ),
    Key(
        [mod, "shift"], "j",
        lazy.layout.shuffle_down()
    ),
    Key(
        [mod, "shift"], "h",
        lazy.layout.swap_left()
    ),
    Key(
        [mod, "shift"], "l",
        lazy.layout.swap_right()
    ),
    # Grow/shrink windows
    Key(
        [mod], "i", lazy.layout.grow()
    ),
    Key(
        [mod], "m", lazy.layout.shrink()
    ),
    Key(
        [mod], "n", lazy.layout.normalize()
    ),
    Key(
        [mod], "o", lazy.layout.maximize()
    ),
    # Move windows up or down in current stack
    Key(
        [mod, "control"], "k",
        lazy.layout.shuffle_down()
    ),
    Key(
        [mod, "control"], "j",
        lazy.layout.shuffle_up()
    ),

    # Switch window focus to other pane(s) of stack
    Key(
        [mod], "space",
        lazy.layout.next()
    ),

    # Swap panes of split stack
    Key(
        [mod, "shift"], "space",
        lazy.layout.rotate()
    ),

    # Toggle between split and unsplit sides of stack.
    # Split = all windows displayed
    # Unsplit = 1 window displayed, like Max layout, but still with
    # multiple stack panes
    Key(
        [mod, "shift"], "Return",
        lazy.layout.toggle_split()
    ),
    Key([mod], "Return", lazy.spawn("urxvt")),

    # Toggle between different layouts as defined below
    Key([mod], "Tab", lazy.nextlayout()),
    Key([mod], "w", lazy.window.kill()),

    Key([mod, "control"], "r", lazy.restart()),
    Key([mod, "control"], "q", lazy.shutdown()),
    Key([mod], "r", lazy.spawncmd()),

    Key([], 'XF86AudioRaiseVolume', lazy.spawn('amixer -q -c 0 sset Master 3dB+ unmute')),
    Key([], 'XF86AudioLowerVolume', lazy.spawn('amixer -q -c 0 sset Master 3dB- unmute')),
    Key([], 'XF86AudioMute', lazy.spawn('amixer -q -c 0 sset Master toggle')),
    Key([], 'XF86MonBrightnessUp', lazy.spawn('xbacklight -inc 3')),
    Key([], 'XF86MonBrightnessDown', lazy.spawn('xbacklight -dec 3'))
]


groups = [Group(i) for i in "123456789"]

 
for i in groups:
    # mod1 + letter of group = switch to group
    keys.append(
        Key([mod], i.name, lazy.group[i.name].toscreen())
    )

    # mod1 + shift + letter of group = switch to & move focused window to group
    keys.append(
        Key([mod, "shift"], i.name, lazy.window.togroup(i.name))
    )

layouts = [ 
    layout.Max(),
    layout.Stack(num_stacks=2, border_focus = "#e39c19", border_normal = "#000000", border_width = 1),
    layout.MonadTall(border_focus = "#e39c19", border_normal = "#000000", border_width = 1, ratio = 0.6)
]

widget_defaults = dict(
    font='DejaVu Sans Mono',
    fontsize=11,
    padding=1,
)

screens = [
    Screen(
        top=bar.Bar(
            widgets = [
                widget.GroupBox(active = "#000000", inactive = "#aaaaaa", this_current_screen_border = "e39c19", highlight_method = "block"),
                widget.Prompt(foreground = "#e39c19", background = "#111111"),
                widget.WindowName(foreground = "#000000"),
                widget.Systray(foreground = "#000000"),
                widget.Sep(padding = 9, foreground = "#333333", height_percent = 60),
                widget.Battery(battery_name='BAT1', foreground = "#000000", hide_threshold=None, charge_char = '+', discharge_char = '-'),
                widget.Sep(padding = 9, foreground = "#333333", height_percent = 60),
                widget.Clock(format='%a %d-%m-%Y %H:%M', foreground = "#000000"),
            ],
            size = 18,
            background = "#8f8a83",
        ),
    ),
]

# Drag floating layouts.
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(),
        start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(),
        start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front())
]

dgroups_key_binder = None
dgroups_app_rules = []
main = None
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False
floating_layout = layout.Floating()
auto_fullscreen = True

# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, github issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "LG3D"