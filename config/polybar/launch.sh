#!/usr/bin/env sh

## Add this to your wm startup file.

# Terminate already running bar instances
killall -q polybar

## Wait until the processes have been shut down
# a veces por esto no carga
#while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

## Launch

## barra arriba
polybar bar &

## barras abajo
## Left bar
polybar color &
polybar log &

## Right bar
polybar power &
polybar top &

## Center bar
polybar music &
