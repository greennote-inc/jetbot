#!/bin/bash

sudo cp /home/jetbot/greennote/jetbot/patch/button_shutdown.service /lib/systemd/system/
sudo systemctl enable button_shutdown.service
sudo systemctl start button_shutdown.service

sudo docker exec -it jetbot_jupyter patch /usr/local/lib/python3.6/dist-packages/Adafruit_MotorHAT-1.4.0-py3.6.egg/Adafruit_MotorHAT/Adafruit_MotorHAT_Motors.py greennote/jetbot/patch/Adafruit_MotorHAT_Motors.patch
sudo docker exec -it jetbot_jupyter patch /usr/local/lib/python3.6/dist-packages/jetbot-0.4.1-py3.6.egg/jetbot/camera/opencv_gst_camera.py greennote/jetbot/patch/opencv_gst_camera.py.patch
