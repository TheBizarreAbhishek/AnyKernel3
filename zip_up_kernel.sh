#!/bin/bash
echo -e "\033[0;32mDeleting last kernel zip\033[0m"
rm *.zip
echo -e "\033[0;32mCopying Kernel Image here\033[0m"
cp ${HOME}/android_kernel_samsung_sm7225/out/arch/arm64/boot/Image ./
cp ${HOME}/android_kernel_samsung_sm7225/out/arch/arm64/boot/dtbo.img ./dtbo
cp ${HOME}/android_kernel_samsung_sm7225/out/arch/arm64/boot/dts/vendor/qcom/lagoon.dtb ./dtb
echo -e "\033[0;32mZip up BizarreKernel\033[0m"
zip -r9 kernel.zip * -x .git *placeholder README.md kernel.zip zip_up_kernel.sh
echo -e "\033[0;32mDeleting Kernel Image\033[0m"
rm Image
rm dtbo
rm dtb
echo -e "\033[0;32mDone\033[0m"
