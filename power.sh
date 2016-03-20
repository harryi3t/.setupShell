alias batteryStatus="upower -i /org/freedesktop/UPower/devices/battery_BAT1 | grep percentage | awk '{print \$2}'"

resetPower() {
  dconf reset -f /com/canonical/indicator/power/
  pkill -f indicator-power-service
}
