#!/bin/bash

echo -e "\033[0;32mDeleting last kernel zip\033[0m"
rm -f *.zip  # Remove any existing zip file

echo -e "\033[0;32mCopying Kernel Image.gz-dtb here\033[0m"
cp ${HOME}/android_kernel_samsung_s5e8835/out/arch/arm64/boot/Image.gz-dtb ./  # Copy compiled kernel

echo -e "\033[0;32mZip up Kernel\033[0m"
zip -r9 kernel.zip * -x .git *placeholder README.md kernel.zip zip_kernel.sh  # Create a zip excluding unnecessary files

echo -e "\033[0;32mCleaning up\033[0m"
rm -f Image.gz-dtb  # Remove copied file after zipping

echo -e "\033[0;32mDone\033[0m"
