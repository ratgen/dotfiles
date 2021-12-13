maxBright=$(< /sys/class/backlight/intel_backlight/max_brightness)
currentBright=$(< /sys/class/backlight/intel_backlight/brightness)

echo "scale=1; $currentBright / $maxBright * 100" | bc
