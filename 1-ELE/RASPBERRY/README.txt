
>>> NOTES <<<

0. Remember to set screen resolution to 1920 x 1080 (without "i").

1. To use Raspberry's UART, SPI, etc. interfaces first remember to enable them via "Menu > Preferences > Raspberry Pi Configuration > Interfaces" and then to restart the device.
   
2. For SSH remote controlling, first retrieve Raspberry IP address (e.g. 192.168.0.33) by opening a terminal window and typing "hostname -I". Then on Windows just open Putty and specify the device IP addess in "Session" and click "Open".

3. For remote controlling Raspberry with PC via VNC:
- on Raspberry Pi enable VNC (by default already installed, see point #1).
- on Windows download and install VNC Viewer, log in, create new connection, name it and specify Raspberry IP address (e.g. 192.168.0.33) and then insert the host ID (e.g. vkn) and password.



>>> TIPS <<<

1. For more details about Raspberry hardware and interfaces setup see the official documentation here:
https://www.raspberrypi.com/documentation

2. For low-level details about concerning the MCU (e.g. how to enable alternate functions) see here:
https://datasheets.raspberrypi.com/bcm2711/bcm2711-peripherals.pdf

3. To automatically open a terminal window and run a python script at start-up :
   - open the "autostart" file -> sudo nano /etc/xdg/lxsession/LXDE-pi/autostart
   - add the following line at the bottom of the file -> @lxterminal -e python3 /home/vkn/Documents/ir_rx.py
   - save and close the file by pressing "Ctrl+X", "y" and "ENTER"
   - reboot Raspberry
   - NB: the autostart file should look like this after the update :
	@lxpanel --profile LXDE-pi
	@pcmanfm --desktop --profile LXDE-pi
	@xscreensaver -no-splash
	@lxterminal -e python3 /home/vkn/Documents/ir_rx.py

4. To check and modify GPIO settings (e.g. IN/OUT, PULL-UP/DOWN, etc) use the command "raspi-gpio help". For instance, "raspi-gpio get" show the status of all GPIOs.

5. To remove vocal assistant open a terminal window and type "sudo apt-get purge orca" and then reboot.



>>> @todo <<<

* Try to remote controlling Raspberry with smartphone (via Bluetooth?).















