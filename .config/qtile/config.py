from libqtile.config import Key, Screen, Group, Drag, Click
from libqtile.command import lazy
from libqtile import layout, bar, widget, hook

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
    # Move windows in current stack
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
    Key([mod], "Tab", lazy.next_layout()),
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
    layout.max.Max(),
    layout.stack.Stack(num_stacks=2, border_focus = "#b5842a", border_normal = "#000000", border_width = 1),
    layout.xmonad.MonadTall(border_focus = "#b5842a", border_normal = "#000000", border_width = 1, ratio = 0.6)
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
                widget.GroupBox(active = "#000000", inactive = "#aaaaaa", this_current_screen_border = "e39c19", this_screen_border = "ic48716", other_screen_border = "#806d46", highlight_method = "block"),
                widget.Sep(padding = 9, foreground = "#444444", height_percent = 60),
                widget.Prompt(foreground = "#bbbbbb", background = "#272727"),
                widget.WindowName(foreground = "#b5842a"),
                widget.Systray(foreground = "#8f8a83"),
                widget.Sep(padding = 9, foreground = "#444444", height_percent = 60),
                widget.CurrentLayout(foreground = "#444444"),
                widget.Sep(padding = 9, foreground = "#444444", height_percent = 60),
                widget.Battery(battery_name='BAT1', foreground = "#8f8a83", hide_threshold=None, charge_char = '+', discharge_char = '-'),
                widget.Sep(padding = 9, foreground = "#444444", height_percent = 60),
                widget.Clock(format='%a %d-%m-%Y %H:%M', foreground = "#8f8a83"),
            ],
            size = 18,
            background = "#111111",
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
floating_layout = layout.floating.Floating()
auto_fullscreen = True

# Fix cursor
@hook.subscribe.startup
def runner():
    import subprocess
    subprocess.Popen(['xsetroot', '-cursor_name', 'left_ptr'])

# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, github issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "LG3D"
