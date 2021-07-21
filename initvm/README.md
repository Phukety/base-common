# 虚拟机初始化脚本

## 常用基础软件
- sudo apt-get -y install vim
- sudo apt-get -y install curl

## 新增root密码
```
sudo passwd
```

## 配置HostName
```
# 设置主机名
sudo hostnamectl set-hostname master
```

## 免密sudo配置
```
sudo sh shells/no_passwd_sudoers.sh
# 若出现错误,使用如下指令修改
pkexec visudo
```

## apt切换阿里源
```
sudo sh shells/switch_ali_sources.sh
```

## **docker**
#### 安装
```
sh shells/install_docker.sh
```
#### 卸载
```
sh shells/uninstall_docker.sh
```

## **k8s**

#### 安装
```
sh shells/install_k8s.sh
```

#### 初始化集群
```
sudo kubeadm init --pod-network-cidr=10.244.0.0/16
```

#### 获取/找回token
```
Kubeadm token list
或
openssl x509 -pubkey -in /etc/kubernetes/pki/ca.crt | openssl rsa -pubin -outform der 2>/dev/null | openssl dgst -sha256 -hex | sed 's/^.* //'
```

#### 普通用户可执行
```
mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config
```
