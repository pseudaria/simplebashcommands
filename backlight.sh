#!/bin/bash

#
# Source: http://askubuntu.com/questions/282201/setting-a-displays-backlight-brightness-to-be-lower-than-is-possible-via-the-no
#

echo 10 | sudo tee /sys/class/backlight/psb-bl/brightness
