#!/bin/bash

BASE_PATH="/home/peter/documents/8semester/slides/"

#RESULT=$(find $BASE_PATH -type f)
#mapfile -d $'\0' RESULT < <(find $BASE_PATH -name "${input}" -print0)
mapfile -d $'\0' RESULT < <(find $BASE_PATH -type f -print0)

declare -a sub=()
for needle in "${RESULT[@]}" ; do # result is quoted to view contents as strings
  # qoutes are needed to treat them as strings
  # sub+=($(echo "$needle" | sed -e 's/\/home\/peter\/documents\/8semester\/slides/\./'))
  echo $needle | sed -e 's/\/home\/peter\/documents\/8semester\/slides/\./' >> /tmp/rofi-files.txt
done

res=$(cat /tmp/rofi-files.txt | rofi -theme onedark -matching normal -dmenu)
echo $res

res=$(echo $res | cut -c 3-)

rm /tmp/rofi-files.txt

if [ "$res" = "" ]; then
  exit 1
fi

xdg-open "$BASE_PATH$res" & disown
