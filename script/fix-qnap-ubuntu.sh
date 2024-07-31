#!/bin/sh
QPKG_NAME=ubuntu-hd
QPKG_DIR=$(/sbin/getcfg $QPKG_NAME Install_Path -f /etc/config/qpkg.conf)
if [ "$QPKG_DIR" = "" ]; then echo "ubuntu-hd not install"; exit; fi 
local_pwd=$(cd $(dirname $0);pwd)

#/share/CACHEDEV1_DATA/.qpkg/ubuntu-hd
[ ! -f ${QPKG_DIR}/bin/linux-station-bak ] && /bin/cp ${QPKG_DIR}/bin/linux-station ${QPKG_DIR}/bin/linux-station-bak
#fix https://repo.huaweicloud.com/ubuntu change http://mirrors.163.com/ubuntu-ports
${local_pwd}/sedp ${QPKG_DIR}/bin/linux-station 733A2F2F7265706F2E687561776569636C6F75642E636F6D2F7562756E74752F 3A2F2F6D6972726F72732E3136332E636F6D2F7562756E74752D706F7274732F

#add /dev/mali0
grep -q "mali0" ${QPKG_DIR}/lxd-script/lxd-profile.yaml || sed "/cgroup:mixed/a\    lxc.mount.entry = /dev/mali0 dev/mali0 none bind,optional,create=file 0 0" -i ${QPKG_DIR}/lxd-script/lxd-profile.yaml
grep -q "mali0" ${QPKG_DIR}/lxd-script/lxd-mount-gpu-audio-arm64.sh || sed "/add gpu into container/a\    \$CMD_LXC config device add $CONTAINER_NAME /dev/mali0 unix-char path=/dev/mali0" -i ${QPKG_DIR}/lxd-script/lxd-mount-gpu-audio-arm64.sh