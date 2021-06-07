#!/bin/python

import aiohttp
import asyncio
import pysmartthings
import sys

token = '8fc64c2a-a9ed-4913-8be0-7cb0cfdaadff'

async def run():
    async with aiohttp.ClientSession() as session:
        api = pysmartthings.SmartThings(session,token)

        devices = await api.devices()
        device = devices[0]
        
        if sys.argv[1] == "--off":
            result = await device.switch_off()

        if sys.argv[1] == "--on":
            result = await device.switch_on()

        if sys.argv[1] == "--vol-up":
            result = await device.volume_up()

        if sys.argv[1] == "--vol-down":
            result = await device.volume_down()

def main():
    loop = asyncio.get_event_loop()
    loop.run_until_complete(run())
    loop.close()

if __name__ == '__main__':
    main()
