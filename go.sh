#!/bin/bash
export XTENSA_TOOLS_ROOT=/opt/Espressif/esp-open-sdk/xtensa-lx106-elf/bin/
export SDK_BASE=/opt/Espressif/esp-open-sdk/sdk/
export PATH=$PATH:/opt/Espressif/esp-open-sdk/xtensa-lx106-elf/bin
export ESPTOOL=/opt/Espressif/esp-open-sdk/esptool/esptool.py
export FW_TOOL=/usr/bin/esptool
echo "############################################################################"
echo "#"
echo "# ESP8266 Docker compiler"
echo "# "
echo "# Builddir:  /opt/Espressif/source"
echo "# Buildcmd:  $BUILDCMD"
echo "# Buildarg:  $BUILDARG"
echo "#"
echo "# XTENSA_TOOLS_ROOT: $XTENSA_TOOLS_ROOT "
echo "# SDK_BASE: $SDK_BASE"
echo "# ESPTOOL: $ESPTOOL"
echo "# FW_TOOL: $FW_TOOL"
echo "#"
echo "# PATH: $PATH"
echo "#"
echo "############################################################################"

su -c "cd /opt/Espressif/source;ls" esp8266 
echo "############################################################################"
su -c "cd /opt/Espressif/source;$BUILDCMD $BUILDARG" esp8266 

