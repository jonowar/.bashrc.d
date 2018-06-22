function spoof-mac(){
    ifconfig en0 | grep ether
    new_mac=`openssl rand -hex 6 | sed 's/\(..\)/\1:/g; s/.$//'`
    sudo ifconfig en0 ether $new_mac
    ifconfig en0 | grep ether
}
