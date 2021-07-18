#!/system/bin/sh
if ! applypatch -c EMMC:/dev/block/bootdevice/by-name/recovery:32625998:dd102c245bbff7fe8c78e4f8a867bebbdbb61807; then
  applypatch -b /system/etc/recovery-resource.dat EMMC:/dev/block/bootdevice/by-name/boot:26457418:354ad8f74c0d723a95e92cc26c1e7a29bb7d8d86 EMMC:/dev/block/bootdevice/by-name/recovery dd102c245bbff7fe8c78e4f8a867bebbdbb61807 32625998 354ad8f74c0d723a95e92cc26c1e7a29bb7d8d86:/system/recovery-from-boot.p && log -t recovery "Installing new recovery image: succeeded" || log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
