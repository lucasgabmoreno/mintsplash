#!/bin/bash

SPLASH_PATH=/usr/share/plymouth/themes/mint-logo
SPLASH_PATH_BAK="$SPLASH_PATH"-bak
IMGFILE=$1

if [ $IMGFILE != "restore" ]; then

    if [ ! -d "$SPLASH_PATH_BAK" ]; then
        sudo cp $SPLASH_PATH $SPLASH_PATH_BAK
    fi

    for splashimg in $SPLASH_PATH/nombre*.png
        do rm -rf $splashimg && cp $IMGFILE $splashimg
    done

    for splashimg in $SPLASH_PATH/nombre*.png
        do rm -rf $splashimg && cp $IMGFILE $splashimg
    done

else
    sudo rm -rf $SPLASH_PATH
    sudo cp $SPLASH_PATH_BAK $SPLASH_PATH 
fi

sudo update-initramfs -u
