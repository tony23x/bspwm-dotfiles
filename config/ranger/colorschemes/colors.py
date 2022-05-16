from ranger.gui.colorscheme import ColorScheme
from ranger.gui.color import *

class colorscheme(ColorScheme):
    progress_bar_color = 1

    def use(self, context):
        fg, bg, attr = default_colors

        if context.reset:
            return default_colors

        elif context.in_browser:
            if context.selected:
                attr = reverse
            else:
                attr = normal
            if context.empty or context.error:
                fg = 7
                bg = 1
###para color de draw_borders en tu rc.conf
            if context.border:
                fg = 15
            if context.image:
                fg = 227
            if context.video:
                fg = 9
            if context.audio:
                fg = 12
            if context.document:
                fg = 13
            if context.container:
                fg = 1
            if context.directory:
                fg = 183

            if not context.selected and (context.cut or context.copied):
                attr = reverse
            if context.main_column:
                if context.marked:
                    fg = 2

        elif context.in_titlebar:
            if context.hostname:
                fg = context.bad and 8 or 48
            elif context.directory:
                fg = 183
            elif context.tab:
                if context.good:
                    fg = 1
            elif context.link:
                fg = 10

        elif context.in_statusbar:
            if context.permissions:
                if context.good:
                    fg = 86
                elif context.bad:
                    fg = 8
        return fg, bg, attr
