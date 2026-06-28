### AnyKernel3 Ramdisk Mod Script
## Bizarre Kernel for Galaxy M35 (m35x) & Galaxy A35 (a35x)
## Exynos 1380 (s5e8835) | One UI 7 / Android 16

### AnyKernel setup
properties() { '
kernel.string=Bizarre Kernel by TheBizarreAbhishek
do.devicecheck=1
do.modules=0
do.systemless=1
do.cleanup=1
do.cleanuponabort=0
device.name1=m35x
device.name2=a35x
device.name3=SM-M356B
device.name4=SM-A356B
device.name5=
supported.versions=
supported.patchlevels=
'; } # end properties

### AnyKernel install
## boot files attributes
boot_attributes() {
set_perm_recursive 0 0 755 644 $RAMDISK/*;
set_perm_recursive 0 0 750 750 $RAMDISK/init* $RAMDISK/sbin;
} # end attributes

# boot shell variables
BLOCK=boot;
IS_SLOT_DEVICE=1;
RAMDISK_COMPRESSION=auto;
PATCH_VBMETA_FLAG=auto;

# import functions/variables and setup patching (DO NOT REMOVE)
. tools/ak3-core.sh;

# boot install
split_boot;

# Flash kernel Image
flash_boot;

## Detect device and flash correct DTBO
ui_print " ";
ui_print "  Bizarre Kernel | Exynos 1380 (s5e8835)";
ui_print " ";

device_codename=$(getprop ro.product.device);
device_model=$(getprop ro.product.model);
ui_print "- Device: $device_model ($device_codename)";

# Flash DTBO partition based on device
BLOCK=dtbo;
reset_ak;

case "$device_codename" in
  m35x)
    ui_print "- Flashing M35 DTBO...";
    flash_boot dtbo-m35x.img;
    ;;
  a35x)
    ui_print "- Flashing A35 DTBO...";
    flash_boot dtbo-a35x.img;
    ;;
  *)
    case "$device_model" in
      *M356B*|*M35*)
        ui_print "- Flashing M35 DTBO (model match)...";
        flash_boot dtbo-m35x.img;
        ;;
      *A356B*|*A35*)
        ui_print "- Flashing A35 DTBO (model match)...";
        flash_boot dtbo-a35x.img;
        ;;
      *)
        ui_print "! Unsupported device: $device_model ($device_codename)";
        ui_print "! Skipping DTBO flash.";
        ;;
    esac
    ;;
esac

ui_print " ";
ui_print "- Done! Reboot to enjoy Bizarre Kernel.";
## end boot install
