#!/bin/sh
echo "source form https://launchpad.net/~liujianfeng1994/+archive/ubuntu/panfork-mesa and https://launchpad.net/~liujianfeng1994/+archive/ubuntu/rockchip-multimedia"
sed 's/mirrors.163.com/mirrors.tuna.tsinghua.edu.cn/' -i /etc/apt/sources.list
apt update
apt install -y openssh-server
sed '/PermitRootLogin/c\PermitRootLogin yes' -i /etc/ssh/sshd_config
/etc/init.d/ssh restart
add-apt-repository ppa:liujianfeng1994/panfork-mesa --yes --no-update
cat <<- EOF > /etc/apt/preferences.d/amazingfated-rk3588-panfork-pin
Package: *
Pin: release o=LP-PPA-liujianfeng1994-panfork-mesa
Pin-Priority: 1001
EOF
sed -i "s/noble/jammy/g" /etc/apt/sources.list.d/liujianfeng1994-ubuntu-panfork-mesa-jammy.list
add-apt-repository ppa:liujianfeng1994/rockchip-multimedia --yes --no-update
cat <<- EOF > /etc/apt/preferences.d/amazingfated-rk3588-rockchip-multimedia-pin
Package: *
Pin: release o=LP-PPA-liujianfeng1994-rockchip-multimedia
Pin-Priority: 1001
EOF
apt-get update
apt-get install -y --allow-downgrades mesa-utils mesa-utils-extra libglx-mesa0 libgl1-mesa-dri glmark2 glmark2-wayland glmark2-es2-wayland glmark2-es2 rockchip-multimedia-config chromium-browser libv4l-rkmpp gstreamer1.0-rockchip libwidevinecdm
apt-get -y dist-upgrade