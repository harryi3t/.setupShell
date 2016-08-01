
if [ -z "$(lsusb | grep '045e:07b9')" ]; then
  xmodmap -e "keycode 110 = Prior"
  xmodmap -e "keycode 112 = Home"
  xmodmap -e "keycode 115 = Next"
  xmodmap -e "keycode 117 = End"
fi
