from openrazer import DeviceManager

device_manager = DeviceManager()

mamba = None
dev = []

for device in device_manager.devices:
    mamba = device
    dev.append(device)

level = mamba.battery_level

if mamba.is_charging:
    print(" " + str(mamba.battery_level) + "%")
else:
    if level <= 10:
        print("  " + str(mamba.battery_level) + "%")
    elif  level > 10 and level <= 35:
        print("  " + str(mamba.battery_level) + "%")
    elif level > 35 and level <= 65:
        print("  " + str(mamba.battery_level) + "%")
    elif level > 65 and level <= 90:
        print("  " + str(mamba.battery_level) + "%")
    if level > 90:
        print("  " + str(mamba.battery_level) + "%")
