# Victor.esp8266Docker
A docker file and espmake comand to compile code using the working dir


## Build docker container
docker build -t esp8266make .

Copy espmake to ~/bin and check if this directory is in your PATH.

## Build blink example
Checkout an example project and build.

	git clone https://github.com/esp8266/source-code-examples.git

	cd source-code-examples/blinky
	espmake clean
	espmake

Sample output:

	############################################################################
	#
	# ESP8266 Docker compiler
	#
	# Builddir:  /opt/Espressif/source
	# Buildcmd:  make
	# Buildarg:
	#
	# XTENSA_TOOLS_ROOT: /opt/Espressif/esp-open-sdk/xtensa-lx106-elf/bin/
	# SDK_BASE: /opt/Espressif/esp-open-sdk/sdk/
	# ESPTOOL: /opt/Espressif/esp-open-sdk/esptool/esptool.py
	# FW_TOOL: /usr/bin/esptool
	#
	# PATH: /usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/opt/Espressif/esp-open-sdk/xtensa-lx106-elf/bin
	#
	############################################################################
	Makefile  README  user
	############################################################################
	CC user/user_main.c
	AR build/app_app.a
	LD build/app.out
	FW firmware/0x00000.bin
	FW firmware/0x40000.bin


Flash with esptool.py

	esptool.py --port /dev/ttyUSB0 write_flash 0x00000 0x00000.bin
