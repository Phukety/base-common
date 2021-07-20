# 卸载docker

# 删除某软件,及其安装时自动安装的所有包
sudo apt-get autoremove -y docker docker-ce docker-engine  docker.io  containerd runc
# 删除无用的相关的配置文件
dpkg -l | grep docker
dpkg -l |grep ^rc|awk '{print $2}' |sudo xargs dpkg -P
sudo apt-get -y autoremove docker-ce-*
# 删除docker的相关配置&目录
sudo rm -rf /etc/systemd/system/docker.service.d
sudo rm -rf /var/lib/docker
# 确定docker卸载完毕
docker --version