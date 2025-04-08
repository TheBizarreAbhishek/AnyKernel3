#!/bin/bash

echo -e "\033[0;32mDeleting last kernel zip\033[0m"
rm -f *.zip

echo -e "\033[0;32mCopying Kernel Image here\033[0m"
cp ${HOME}/android_kernel_samsung_s5e8835/out/arch/arm64/boot/Image ./

echo -e "\033[0;32mCopying DTBO\033[0m"
cp ${HOME}/android_kernel_samsung_s5e8835/out/arch/arm64/boot/dtbo.img ./dtbo

# Optional: if your kernel needs a separate DTB (check your AnyKernel3 config)
# echo -e "\033[0;32mCopying DTB\033[0m"
# cp ${HOME}/android_kernel_samsung_s5e8835/out/arch/arm64/boot/dts/samsung/m35x.dtb ./dtb

echo -e "\033[0;32mZipping up BizarreKernel\033[0m"
zip -r9 kernel.zip * -x .git* *placeholder README.md kernel.zip zip_up_kernel.sh

echo -e "\033[0;32mCleaning up\033[0m"
rm -f Image dtbo dtb

echo -e "\033[0;32mDone\033[0m"
