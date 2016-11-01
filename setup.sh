#!/bin/sh

# Upgrade PIP
pip2.7 install --upgrade pip

# Install requirements
pip2.7 install -r requirements

# Download Androguard
git clone https://github.com/androguard/androguard.git

# Setup Androguard
cd androguard
python setup.py install
cd ..

# Download and build apktool

# git clone git://github.com/iBotPeaches/Apktool.git
# cd Apktool
# ./gradlew build fatJar
# mv brut.apktool/apktool-cli/build/libs/apktool-cli.jar ../apktool.jar
# cd ..
# rm -rf Apktool/

# Download latest release without build apktool
# TODO fix $apktool_link with curl
# apktool_version=$(curl -s -I https://github.com/iBotPeaches/Apktool/releases/latest -I | awk '/Location: (.*)/ {print $2}' | tail -n 1)
# apktool_link="https://github.com$(curl -s $apktool_version | grep 'releases/download' | cut -d '"' -f 2)"
# wget -O apktool.jar $apktool_link
wget -O apktool.jar https://github.com/iBotPeaches/Apktool/releases/download/v2.2.1/apktool_2.2.1.jar

# Download and unzip dex2jar
wget https://bitbucket.org/pxb1988/dex2jar/downloads/dex2jar-2.0.zip
unzip dex2jar-2.0.zip
rm dex2jar-2.0.zip
chmod +x dex2jar-2.0/*

# Download frida-server
curl -O http://build.frida.re/frida/android/arm/bin/frida-server
chmod +x frida-server
adb forward tcp:27042 tcp:27042
