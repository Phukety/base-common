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

## 免密配置
```
1.sudo sh shells/no_passwd_sudoers.sh
2.重启

# 若出现错误,使用如下指令修改
pkexec visudo
```

## apt切换阿里源
```
sudo sh shells/switch_ali_sources.sh
```

## docker
```
// 安装
sh shells/install_docker.sh

// 卸载
sh shells/uninstall_docker.sh
```

## k8s
```
// 安装
sh shells/install_k8s.sh
```