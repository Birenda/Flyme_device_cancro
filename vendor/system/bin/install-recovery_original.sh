#!/system/bin/sh
if [ -f /system/etc/recovery-transform.sh ]; then
  exec sh /system/etc/recovery-transform.sh 13588480 9ff363e605419d7ef25f9868e581ddc9da3f440e 10840064 94b7d198f9436a2f6b2f1791d7da1bceec6f5524
fi

if ! applypatch -c EMMC:/dev/block/platform/msm_sdcc.1/by-name/recovery:13588480:9ff363e605419d7ef25f9868e581ddc9da3f440e; then
  applypatch -b /system/etc/recovery-resource.dat EMMC:/dev/block/platform/msm_sdcc.1/by-name/boot:10840064:94b7d198f9436a2f6b2f1791d7da1bceec6f5524 EMMC:/dev/block/platform/msm_sdcc.1/by-name/recovery 9ff363e605419d7ef25f9868e581ddc9da3f440e 13588480 94b7d198f9436a2f6b2f1791d7da1bceec6f5524:/system/recovery-from-boot.p && log -t recovery "Installing new recovery image: succeeded" || log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
