# docker 安装

echo "-------docker安装"
sudo apt-get update
sudo apt-get install -y apt-transport-https ca-certificates
curl gnupg-agent software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt-get update
sudo apt-get -y install docker-ce docker-ce-cli containerd.io

echo "-------docker免sudo配置"
sudo groupadd docker
sudo gpasswd -a `who | awk '{print $1}' | awk 'NR==1'` docker
sudo service docker restart
newgrp - docker

echo "-------docker镜像加速"
sudo mkdir -p /etc/docker
sudo tee /etc/docker/daemon.json <<-'EOF'
{
  "registry-mirrors": ["https://6qz5kc5w.mirror.aliyuncs.com"]
}
EOF
sudo systemctl daemon-reload
sudo systemctl restart docker