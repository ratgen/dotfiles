from openrazer.client import DeviceManager
import sys

device_manager = DeviceManager()

mamba = None
dev = []

for device in device_manager.devices:
    mamba = device
    dev.append(device)

if mamba.is_charging:
    print(" " + str(mamba.battery_level) + "%")
else:
    print("  " + str(mamba.battery_level) + "%")
