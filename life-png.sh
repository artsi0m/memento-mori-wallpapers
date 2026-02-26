#!/usr/bin/env bash

bd="2000-07-28" # Birthday date
dh="1440" # Display height
dw="2560" # Display width
un="artsi0m" # user name

wget \
    "https://lifecal-virid.vercel.app/life?birthday=${bd}&height=${dh}&width=${dw}" \
    -O ~/Pictures/Life/dark.png

(cd "/home/${un}/Pictures/Life/" || exit
 magick dark.png -channel RGB -negate light.png
)

gsettings set org.gnome.desktop.background \
	  picture-uri-dark "file:///home/${un}/Pictures/Life/dark.png"

gsettings set org.gnome.desktop.background \
	  picture-uri "file:///home/${un}/Pictures/Life/light.png"
