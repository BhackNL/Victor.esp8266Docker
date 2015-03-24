FROM ubuntu:14.04

RUN DEBIAN_FRONTEND=noninteractive apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y -q git autoconf build-essential gperf bison flex texinfo libtool libncurses5-dev wget apt-utils gawk sudo unzip libexpat-dev
RUN useradd -d /opt/Espressif -m -s /bin/bash esp8266
RUN echo "esp8266 ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/esp8266
RUN chmod 0440 /etc/sudoers.d/esp8266
RUN cd /opt/Espressif;su -c "git clone https://github.com/pfalcon/esp-open-sdk.git" esp8266
RUN cd /opt/Espressif/esp-open-sdk;su -c "make STANDALONE=y" esp8266
RUN echo "export XTENSA_TOOLS_ROOT=/opt/Espressif/esp-open-sdk/xtensa-lx106-elf/bin/" >> /opt/Espressif/.bashrc
RUN echo "export SDK_BASE=/opt/Espressif/esp-open-sdk/sdk/" >> /opt/Espressif/.bashrc
RUN echo "export PATH=$PATH:/opt/Espressif/esp-open-sdk/xtensa-lx106-elf/bin" >> /opt/Espressif/.bashrc
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y -q python python-dev python-pip picocom
RUN echo "export ESPTOOL=/opt/Espressif/esp-open-sdk/esptool/esptool.py" >> /opt/Espressif/.bashrc
RUN pip install pyserial
RUN cd /tmp;wget http://filez.zoobab.com/esp8266/esptool-0.0.2.zip
RUN cd /opt/Espressif;unzip /tmp/esptool-0.0.2.zip
RUN cd /opt/Espressif/esptool;perl -pi -e 's/WINDOWS/LINUX/' Makefile
RUN cd /opt/Espressif/esptool;make;cp esptool /usr/bin
RUN cp /opt/Espressif/esp-open-sdk/esptool/esptool.py /usr/bin
ADD go.sh /go.sh
CMD ["/go.sh"]

