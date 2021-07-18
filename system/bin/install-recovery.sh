#!/system/bin/sh
if ! applypatch -c EMMC:/dev/block/bootdevice/by-name/recovery:32609614:34782c74e24121f0e1e93f1e6f20c1a5e06b9556; then
  applypatch -b /system/etc/recovery-resource.dat EMMC:/dev/block/bootdevice/by-name/boot:26453322:4e2b2c52437f4f4ac154faf1fcae9b00cdcab45f EMMC:/dev/block/bootdevice/by-name/recovery 34782c74e24121f0e1e93f1e6f20c1a5e06b9556 32609614 4e2b2c52437f4f4ac154faf1fcae9b00cdcab45f:/system/recovery-from-boot.p && log -t recovery "Installing new recovery image: succeeded" || log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
