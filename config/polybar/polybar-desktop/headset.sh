#! /bin/bash

OUTPUT="$(headsetcontrol --output json)"

DEVICE="$(echo $OUTPUT | jq '.devices')"

ERROR="$(echo $OUTPUT | jq '.devices[0].errors')"

if [ "$ERROR" == "[]" ]; then
  echo " No device connected"
  exit 0
fi

if [ "$ERROR" != "null" ]; then
  echo " "
  exit 0
fi


BATTERY_LEVEL="$(echo $OUTPUT | jq '.devices[0].battery.level')"
CHATMIX="$(echo $OUTPUT | jq '.devices[0].chatmix')"

print_battery_level() {
  echo " $1  $BATTERY_LEVEL%  Mix: $CHATMIX"
}

if [ "$BATTERY_LEVEL" -lt 10 ];then
  print_battery_level ""
elif [ "$BATTERY_LEVEL" -lt 35 ] && [ "$BATTERY_LEVEL" -ge 10 ]; then
  print_battery_level ""
elif [ "$BATTERY_LEVEL" -lt 65 ] && [ "$BATTERY_LEVEL" -ge 35 ]; then
  print_battery_level ""
elif [ "$BATTERY_LEVEL" -lt 90 ] && [ "$BATTERY_LEVEL" -ge 65 ]; then
  print_battery_level ""
elif [ "$BATTERY_LEVEL" -ge 90 ]; then
  print_battery_level ""
fi
