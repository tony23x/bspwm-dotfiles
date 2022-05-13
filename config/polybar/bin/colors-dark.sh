#!/usr/bin/env bash

# Color files
PFILE="$HOME/.config/polybar/colors.ini"
RFILE="$HOME/.config/rofi/themes/colors.rasi"
MFILE="$HOME/.config/polybar/modules.ini"
DFILE="$HOME/.config/dunst/dunstrc"
BFILE="$HOME/.config/bspwm/bspwmrc"

# Change colors
change_color() {
	# polybar
	sed -i -e "s/background = #.*/background = $BG/g" $PFILE
	sed -i -e "s/foreground = #.*/foreground = $FG/g" $PFILE
	sed -i -e "s/altblack = #.*/altblack = $AB/g" $PFILE
        sed -i -e "s/icon = #.*/icon = $IC/g" $PFILE
        sed -i -e "s/vote = #.*/vote = $IAC/g" $PFILE
        sed -i -e "s/font = #.*/font = $FONT/g" $PFILE
	sed -i -e "s/logo = #.*/logo = $FAC/g" $PFILE
	sed -i -e "s/ac = #.*/ac = $AC/g" $PFILE
	sed -i -e "s/bar = #.*/bar = $BAR/g" $PFILE
### modules polybar
	sed -i -e "s/%upspeed% %{.*/%upspeed% %{F$IC}%{T2} %{T-}%{F-} - %downspeed% %{F$IC}%{T2}%{T-}%{F-}/g" $MFILE

	polybar-msg cmd restart
### dunst
	pkill dunst
	sed -i 's/frame_color = .*/frame_color = "'$AC'"/' $DFILE
### bspwmrc
	sed -i 's/bspc config focused.*/bspc config focused_border_color "'$AC'"/' $BFILE 
}

if  [[ $1 = "--green" ]]; then
	BG="#f4f2f2"
	FG="#f32453"	AC="#04dcb3"	AB="#bff2dd"	IAC="#000000"
	FAC="#000000"	FONT="#f4f2f2"	IC="#f32453"	BAR="#000000"
	change_color
	feh --bg-fill $HOME/Walls/anime-girl-02.png
	cp $HOME/.config/rofi/themes/menu/green/colors.rasi $HOME/.config/rofi/themes/
elif  [[ $1 = "--pink" ]]; then
	BG="#02131a"
	FG="#a9b1d6"	AC="#f7768e"	AB="#444b6a"	IAC="#000000"
	FAC="#000000"	FONT="#ffffff"	IC="#f7768e"	BAR="#1a1b26"
	change_color
	feh --bg-fill $HOME/Walls/anime-girl-01.jpg
	cp $HOME/.config/rofi/themes/menu/pink/colors.rasi $HOME/.config/rofi/themes/
else
	cat <<- _EOF_
	No option specified, Available options:
	--pink	--green	--red
	_EOF_
fi
