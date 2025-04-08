#!/bin/bash

echo -e "\033[0;32mDeleting last kernel zip\033[0m"
rm -f *.zip

echo -e "\033[0;32mCopying Kernel Image here\033[0m"
cp arch/arm64/boot/Image ./

echo -e "\033[0;32mCopying DTBO\033[0m"
cp arch/arm64/boot/dtbo.img ./dtbo

echo -e "\033[0;32mZipping up BizarreKernel\033[0m"
zip -r9 kernel.zip * -x .git* *placeholder README.md kernel.zip zip_up_kernel.sh

echo -e "\033[0;32mCleaning up\033[0m"
rm -f Image dtbo

echo -e "\033[0;32mDone\033[0m"
