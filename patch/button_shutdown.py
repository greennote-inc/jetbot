#!/usr/bin/env python3

import subprocess
import time
import Jetson.GPIO as GPIO

pin = 40    # default Greennote board setting
pressedTime = 1

GPIO.setmode(GPIO.BOARD)
GPIO.setup(pin, GPIO.IN)
GPIO.setwarnings(False)

def callback_fn(channel):
    global pressedTime
    state = GPIO.input(pin)
    if state == 0: #  button released
        duration = time.time() - pressedTime
        if duration > 5.0:
            print(duration)
            subprocess.run(('/sbin/shutdown', '-h', 'now'))
    else:  # button pushed
        pressedTime = time.time()
    return

def main():
    GPIO.add_event_detect(pin, GPIO.BOTH, callback=callback_fn)

if __name__ == '__main__':
    main()
    while True:
        time.sleep(1)
