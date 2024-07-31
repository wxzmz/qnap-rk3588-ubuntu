# 主要是解决qnap的rk3588机型的Ubuntu Linux Station 3.4.3.548的安装BUG 以及chrome硬解
qnap TS-AI642 固件版本5.18测试完成   
实测 硬件rock-5c 3582 8g内存 安装 qnap TS-AI642 5.18  
qnap下的Ubuntu22.04 桌面和chrome观看视频很流畅  

fix-qnap-ubuntu 主要是一键修复qnap的Ubuntu Linux Station 3.4.3.548的安装BUG,以及添加mali给Ubuntu 22.04  
mesa-vpu.sh    一键安装mesa-vpu以及相关依赖 (以及安装了openssh 方便调试)  

mesa-vpu.sh脚本源之  
https://launchpad.net/~liujianfeng1994/+archive/ubuntu/panfork-mesa  
https://launchpad.net/~liujianfeng1994/+archive/ubuntu/rockchip-multimedia

## 一.安装补丁流程
####  1.1 先自行安装Ubuntu Linux Station 3.4.3.548  
>**ps 安装完成后 先停止Ubuntu Linux Station 再安装补丁**   
![stop](https://github.com/wxzmz/qnap-arm-ubuntu/blob/main/jpeg/stop.jpg)  
 先停止 Ubuntu Linux Station,不先安装Ubuntu22.04   
 把fix-qnap-ubuntu上传进qnap目录,加上执行权限,admin权限执行

```Shell 
chmod +x ./fix-qnap-ubuntu  
./fix-qnap-ubuntu
```
>
  
#### 1.2 fix-qnap-ubuntu完成后,启动Ubuntu Linux Station,安装Ubuntu22.04  
>Ubuntu22.04安装完成后 远程桌面/键鼠 进入Ubuntu22.04 桌面  
打开终端 sudo -i,输入密码,root权限下执行mesa-vpu.sh  
>
```Shell 
sudo -i  
curl https://raw.githubusercontent.com/wxzmz/qnap-arm-ubuntu/main/mesa-vpu.sh | bash -  
```
  
主要是安装chrome以及各种依赖和升级,等待脚本安装完成时间较长    

#### 1.3 脚本安装完成后,必须重启一次Ubuntu22.04
打开chrome 观看视频已经是硬解状态

ps: 经测试 必须链接hdmi接口 ,否则还是软解



