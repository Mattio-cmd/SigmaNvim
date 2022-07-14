#! /bin/sh
if (( $EUID == 0 )); then
    echo "ERROR, script cant be run as root"
    exit
fi

echo "Make sure you have ~/local/bin on your PATH"

chmod +x bin/themechanger.sh
cp ./bin/themechanger.sh $HOME/.local/bin
echo "themechanger.sh &" >> $HOME/.xinitrc
