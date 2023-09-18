from libqtile.config import Key, Group
from libqtile.command import lazy
from .keys import keys
from .to_import import mod, alt, group_apps

groups = [
    Group("1", label = "󰨞"),
    Group("2", label = ""),
    Group("3", label = ""),
    Group("4", label = ""),
    Group("5", label = ""),
    Group("6", label = ""),
    Group("7", label = "", layout="Max"),
    Group("8", label = ""),
    Group("9", label = ""),
]

for i in groups:
    default_app = group_apps[i.name]
    
    keys.extend([
        Key([mod], i.name,
            lazy.group[i.name].toscreen(), 
            desc="Switch to group {}".format(i.name)),

        Key([mod, alt], i.name,
            lazy.window.togroup(i.name),
            desc="Move focused window to group {}".format(i.name)),
        
        Key([mod], "Right", 
            lazy.screen.next_group(),
            desc="Switch to next group"),

        Key([mod], "Left", 
            lazy.screen.prev_group(),
            desc="Switch to previous group"),
    ])

    def open_default_app(qtile):
        current_group = qtile.current_group.name
        default_app = group_apps[current_group]
        if default_app:
            qtile.cmd_spawn(default_app)

    keys.extend([
        Key([mod], "p",
            lazy.function(open_default_app),
            desc="Launch the i workspace default app")
    ])
