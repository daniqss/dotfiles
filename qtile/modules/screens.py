from libqtile.config import Screen
from .to_import import *
from .bars import *

# #
# #   SCREENS
# #

screens = [
    Screen(top=screen1_bar),
    Screen(top=screen2_bar)
]
