# Attach & Detach

I found this from [Comex](https://github.com/comex/attach-and-detach), and [async_wake_ios](https://github.com/xerub/async_wake_ios/blob/master/async_wake_ios/libjb/hdik.c), another modified version. I just wrote a build script to make it a package :-)

You can mount iOS Developer Disk Image without Xcode.


## Usage

```shell script
# 1. attach an image
attach DeveloperDiskImage.dmg
```

Example:

```txt
iPhone:~ root# attach DeveloperDiskImage.dmg
/dev/disk6
```

```shell script
# 2. create mount point
mkdir -p /mnt/dmg

# 3. mount disk
mount_hfs -o ro /dev/disk6 /mnt/dmg
```

Example (ignore such error):

```txt
iPhone:~ root# mount_hfs -o ro /dev/disk6 /mnt/dmg
mount_hfs: Could not create property for re-key environment check: No such file or directory
iPhone:~ root# ls /mnt/dmg/
Applications/  Library/  System/  usr/
```

```shell script
# 4. umount disk
umount /mnt/dmg

# 5. detach dmg
detach /dev/disk6
```

