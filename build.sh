#!/bin/bash

xcrun clang -fPIC -Wall -Os -pipe -g3 attach.c -o build/attach -F. -Wl,-framework,Foundation,-framework,CoreFoundation,-framework,IOKit -isysroot /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS.sdk -I. -IIOKit_private -arch arm64 -Wl,-dead_strip
ldid -Sent.xml build/attach

xcrun clang -fPIC -Wall -Os -pipe -g3 detach.c -o build/detach -F. -Wl,-framework,Foundation,-framework,CoreFoundation,-framework,IOKit -isysroot /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS.sdk -I. -IIOKit_private -arch arm64 -Wl,-dead_strip
ldid -Sent.xml build/detach

