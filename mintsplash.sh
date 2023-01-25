#!/bin/bash

SPLASH_PATH=/usr/share/plymouth/themes/mint-logo
SPLASH_PATH_BAK="$SPLASH_PATH"-bak
IMGFILE=$1

if [ $IMGFILE != "restore" ]; then

    # Backup
    if [ ! -d "$SPLASH_PATH_BAK" ]; then
        sudo cp $SPLASH_PATH $SPLASH_PATH_BAK
    fi
    
    # Linux Mint
    for splashimg in $SPLASH_PATH/nombre*.png
        do sudo rm -rf $splashimg && sudo cp $IMGFILE $splashimg
    done

    for splashimg in $SPLASH_PATH/nombre*.png
        do sudo rm -rf $splashimg && sudo cp $IMGFILE $splashimg
    done
    
    # LMDE
    sudo rm -rf $SPLASH_PATH/logo.png
    sudo cp $IMGFILE $SPLASH_PATH/logo.png
    sudo rm -rf $SPLASH_PATH/spinner.png
    sudo cp transparent.png $SPLASH_PATH/spinner.png

else
    sudo rm -rf $SPLASH_PATH
    sudo cp $SPLASH_PATH_BAK $SPLASH_PATH 
fi

sudo update-initramfs -u
