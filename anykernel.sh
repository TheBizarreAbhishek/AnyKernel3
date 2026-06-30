### AnyKernel3 Ramdisk Mod Script
## Bizarre Kernel for Galaxy M35/A35 (s5e8835)
## by TheBizarreAbhishek

### AnyKernel setup
properties() { '
kernel.string=Bizarre Kernel by TheBizarreAbhishek
do.devicecheck=0
do.modules=0
do.systemless=0
do.cleanup=1
do.cleanuponabort=0
device.name1=
device.name2=
device.name3=
device.name4=
device.name5=
supported.versions=
supported.patchlevels=
supported.vendorpatchlevels=
'; } # end properties

### AnyKernel install
## boot shell variables
block=boot
is_slot_device=auto
ramdisk_compression=auto
patch_vbmeta_flag=auto
no_magisk_check=1

# import functions/variables and setup patching (DO NOT REMOVE)
. tools/ak3-core.sh

ui_print " "
ui_print "****************************************"
ui_print "*      Bizarre Kernel | s5e8835        *"
ui_print "*      by Abhishek Babu                *"
ui_print "****************************************"
ui_print " "

ui_print "- Preparing installation environment..."
split_boot

if [ -f "split_img/ramdisk.cpio" ]; then
    ui_print "- Unpacking ramdisk..."
    unpack_ramdisk
    ui_print "- Writing new kernel Image..."
    write_boot
else
    ui_print "- Flashing kernel Image..."
    flash_boot
fi

ui_print " "
ui_print "Done! Reboot to enjoy Bizarre Kernel!"
ui_print " "
