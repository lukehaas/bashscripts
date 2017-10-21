#!/bin/sh

display=$(xrandr -q|grep -v dis|grep connected|awk '{print $1}')
orientation=$(xrandr -q|grep -v dis|grep connected|awk '{print $5}')

if [ "$orientation" == "right" ]; then
  xrandr --output $display --rotate inverted
else
  xrandr --output $display --rotate right
fi

