#!/bin/bash

LAYOUT=$(hyprctl -j getoption general:layout | jq '.str' | sed 's/"//g')

case $LAYOUT in
	"master")
		hyprctl keyword general:layout dwindle
		hyprctl keyword unbind SUPER, H
  		hyprctl keyword unbind SUPER, J
    	hyprctl keyword unbind SUPER, K
  		hyprctl keyword unbind SUPER, L
		hyprctl keyword bind SUPER, H, movefocus, l
  		hyprctl keyword bind SUPER, J, movefocus, u
		hyprctl keyword bind SUPER, K, movefocus, d
  		hyprctl keyword bind SUPER, L, movefocus, r

  	;;
	"dwindle")
  		hyprctl keyword general:layout master
		hyprctl keyword unbind SUPER, H
  		hyprctl keyword unbind SUPER, J
    	hyprctl keyword unbind SUPER, K
  		hyprctl keyword unbind SUPER, L
		hyprctl keyword bind SUPER, H, layoutmsg, cyclenext
		hyprctl keyword bind SUPER, J, layoutmsg, focusmaster
		hyprctl keyword bind SUPER, K, layoutmsg, swapwithmaster
		hyprctl keyword bind SUPER, L, layoutmsg, orientationnext
  	;;
*) ;;

esac
