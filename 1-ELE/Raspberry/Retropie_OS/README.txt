
>>> SETUP RETROPIE (pt.1 - PC) <<<

1. Install and run "Raspberry Pi Imager" (v.1.8.1+);

2. After running "Raspberry Pi Imager" choose "Raspberry Pi 4" as "Raspberry Pi Device", "Emulation and game OS > Retropie > RetroPie 4.8+ (RPI 4/400)" as "Operative System", "32GB SanDisk SD Card" as "Storage", and flash the SD card;

>>> SETUP RETROPIE (pt.2 - Raspberry) <<<

3. Insert the flashed SD card into Raspberry and connect the PS3 joystick into one of its USB sockets;

4. Power-up Raspberry;

5. Once initialization is done, follow instructions to map each key of the PS3 joystick;

6. Move to the "Retropie" tab (default), click "O", move to "RASPI CONFIG > Localisation Options > WLAN Country" and select "Italy";

7. In the same main menu now go go to "WIFI", select your Wifi network, and insert Wifi password to give Raspberry access to internet;


§ Move to the "Retropie" tab (default), click "O", move to "RETROPIE SETUP > Configuration/Tools > usbromservice" and enable "USB ROM Service";

§ Now move to "RETROPIE SETUP > Manage Packages > Manage experimental packages" and install (from pre-compiled binary) "drastic" (for NintendoDS emulator) + "lr-desmume2015" + "lr-desmume"

and "re-install (from binary)" if not running the lastest binaty when finished

>>> SETUP RETROPIE (pt.3 - PC) <<<

§ Plug-in a free 32GB+ USB stick, and format it as FAT32;

§ Inside the formatted USB stick create an empty folder named "retropie-mount", and then eject it;

>>> SETUP RETROPIE (pt.4 - Raspberry) <<<

§ Plug-in the USB stick into Raspberry and restart it by clicking "Select > Quit > Restart System";

§ Once restarted, wait 2 minutes for Raspberry to automatically write all its internal folders into USB stick, and then remove the USB stick;

>>> SETUP RETROPIE (pt.5 - PC) <<<

§ Plug-in the USB stick into PC and all the empty ROM folders should have been added to ".\retropie-mount\roms\"

------------------

>>> ROMS <<<

Hereafter for each game type, USB stick folder and expected extensions is specified:

- GameBoy Advance |  ./roms/gba/ | .gba;
- NeoGeo | ./roms/arcade/ | .zip;
- Nintendo DS | ./roms/nds/ | .nds;
- PlayStation1 | ./roms/psx/ | .bin + .cue;
- Super Nintendo | ./roms/snes/ | .zip;

------------------

>>> SFTP CONNECTIVITY <<<
retropie main meu:
raspi-config > interface options
show ip > 192.168.1.8

Filezilla:
- new site
- enter ip
- SFTP
- logon type normal
- user pi
. password raspberry

home/opt/retropie/emulator/drastic/usrcheat.dat


------------------
>>> EXTRA TIPS <<<

- never rename an arcade .zip file, otherwise it won't work;
- press "SELECT" to insert coin;
- press "HOTKEY+START" to exit game;
- press "HOTKEY+A" or "L2" for options (e.g. for remaping keys);
- press "HOTKEY+X" to reset game;
- to use PS3 joystick via Bluetooth, first install the drivers "sixaxis" and "ps3controller" (in "Manage packages" section), then launch the pairing procedure from "Bluetooth > Register and connect to Bluetoothdevice";
- each time new games are added to external USB stick, restart emulator;
- each time any system setting is updated (through Retropie's main menu), restart Retropie.

------------------

>>> @TODO <<<

1. investigate how to improve display visualization in terms of resolution, refresh-rate, etc (e.g. via "Display Options > Underscan").

2a. investigate how to pack multiple .bin files for PSX games;
2b. add BIOS for psx.
[for both see here: https://retropie.org.uk/docs/Playstation-1/]

3. investigate how to enable "pause" in arcade games.

4. investigate how to add psp games (e.g. MotoGP): which folder? required additional packages?
