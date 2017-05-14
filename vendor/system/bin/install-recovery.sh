#!/system/bin/sh
if [ -f /system/etc/recovery-transform.sh ]; then
  exec sh /system/etc/recovery-transform.sh 12376064 ab439da0e6de3dc8e4c1def5734e115ff4a54d1e 7598080 f49c2da07640813a582cd8ea9c34a551ddcb186c
fi

if ! applypatch -c EMMC:/dev/block/platform/msm_sdcc.1/by-name/recovery:12376064:ab439da0e6de3dc8e4c1def5734e115ff4a54d1e; then
  applypatch -b /system/etc/recovery-resource.dat EMMC:/dev/block/platform/msm_sdcc.1/by-name/boot:7598080:f49c2da07640813a582cd8ea9c34a551ddcb186c EMMC:/dev/block/platform/msm_sdcc.1/by-name/recovery ab439da0e6de3dc8e4c1def5734e115ff4a54d1e 12376064 f49c2da07640813a582cd8ea9c34a551ddcb186c:/system/recovery-from-boot.p && log -t recovery "Installing new recovery image: succeeded" || log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
