### AnyKernel3 Ramdisk Mod Script
## osm0sis @ xda-developers

### AnyKernel setup
properties() { '
kernel.string=BizarreKernel by Abhishek Babu for Galaxy M35
do.devicecheck=1
do.modules=0
do.systemless=1
do.cleanup=1
do.cleanuponabort=0
device.name1=m35x
'; }

### AnyKernel install
init_boot_attributes() {
  set_perm_recursive 0 0 755 644 $RAMDISK/*
  set_perm_recursive 0 0 750 750 $RAMDISK/init* $RAMDISK/sbin
}

# init_boot shell variables
BLOCK=/dev/block/sda16
IS_SLOT_DEVICE=0
RAMDISK_COMPRESSION=auto
PATCH_VBMETA_FLAG=auto

. tools/ak3-core.sh

# install logic
dump_boot # unpack init_boot.img including ramdisk

# optional ramdisk patching (e.g. magisk, susfs)
# backup_file init.rc
# replace_string init.rc "original" "replacement" "context"

write_boot # repack and flash init_boot.img
