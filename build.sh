#!/bin/bash

mkdir -p layout/usr/sbin

xcrun clang -fPIC -Wall -Os -pipe -g3 attach.c -o build/attach -F. -Wl,-framework,Foundation,-framework,CoreFoundation,-framework,IOKit -isysroot /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS.sdk -I. -IIOKit_private -arch arm64 -Wl,-dead_strip
ldid -Sent.xml build/attach
cp -p build/attach layout/usr/sbin

xcrun clang -fPIC -Wall -Os -pipe -g3 detach.c -o build/detach -F. -Wl,-framework,Foundation,-framework,CoreFoundation,-framework,IOKit -isysroot /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS.sdk -I. -IIOKit_private -arch arm64 -Wl,-dead_strip
ldid -Sent.xml build/detach
cp -p build/detach layout/usr/sbin

sudo chown root:wheel layout/usr/sbin/attach
sudo chown root:wheel layout/usr/sbin/detach

dpkg-deb -Z xz --build layout dist/com.darwindev.attach-and-detach_0.1-1_iphoneos-arm.deb

