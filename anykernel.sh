### AnyKernel3 Ramdisk Mod Script
## Bizarre Kernel for Galaxy M35 (m35x) + Galaxy A35 (a35x)
## Exynos 1380 (s5e8835) | One UI 7 / Android 16
## by TheBizarreAbhishek

### AnyKernel setup
properties() { '
kernel.string=Bizarre Kernel by TheBizarreAbhishek
do.devicecheck=0
do.soccheck=1
do.modules=0
do.systemless=1
do.cleanup=1
do.cleanuponabort=0
device.soc=s5e8835
supported.versions=13 - 17
supported.patchlevels=
supported.vendorpatchlevels=
'; } # end properties

### AnyKernel install
# boot shell variables
block=boot
is_slot_device=auto
ramdisk_compression=auto
patch_vbmeta_flag=auto
NO_MAGISK_CHECK=1

# import functions/variables and setup patching (DO NOT REMOVE)
. tools/ak3-core.sh;

# boot install
if [ -L "/dev/block/bootdevice/by-name/init_boot_a" -o -L "/dev/block/by-name/init_boot_a" ] \
  || [ -L "/dev/block/bootdevice/by-name/init_boot" -o -L "/dev/block/by-name/init_boot" ]; then
    split_boot;
    flash_boot;
else
    dump_boot;
    write_boot;
fi
## end boot install

# Flash DTBO based on detected device
device_codename=$(getprop ro.product.device);
device_model=$(getprop ro.product.model);

ui_print " ";
ui_print "  Bizarre Kernel | Exynos 1380 (s5e8835)";
ui_print "  Device: $device_model ($device_codename)";
ui_print " ";

case "$device_codename" in
  m35x)
    ui_print "- Flashing Galaxy M35 DTBO...";
    flash_generic dtbo-m35x.img;
    ;;
  a35x)
    ui_print "- Flashing Galaxy A35 DTBO...";
    flash_generic dtbo-a35x.img;
    ;;
  *)
    case "$device_model" in
      *M356B*|*M35*)
        ui_print "- Flashing Galaxy M35 DTBO (model match)...";
        flash_generic dtbo-m35x.img;
        ;;
      *A356B*|*A35*)
        ui_print "- Flashing Galaxy A35 DTBO (model match)...";
        flash_generic dtbo-a35x.img;
        ;;
      *)
        ui_print "! Unknown device: $device_model ($device_codename)";
        ui_print "! Skipping DTBO flash.";
        ;;
    esac
    ;;
esac

ui_print " ";
ui_print "  Done! Reboot to enjoy Bizarre Kernel.";
