#! /bin/bash


THIS="$(headsetcontrol -bc)"

if [ "$THIS" -lt 10 ];then
  echo "  $THIS%"
elif [ "$THIS" -lt 35 ] && [ "$THIS" -ge 10 ]; then
  echo "  $THIS%"
elif [ "$THIS" -lt 65 ] && [ "$THIS" -ge 35 ]; then
  echo "  $THIS%"
elif [ "$THIS" -lt 90 ] && [ "$THIS" -ge 65 ]; then
  echo "  $THIS%"
elif [ "$THIS" -ge 90 ]; then
  echo "  $THIS%"
fi
