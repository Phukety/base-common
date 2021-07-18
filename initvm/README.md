# 虚拟机初始化脚本

## 常用基础软件
- sudo apt-get -y install vim
- sudo apt-get -y install curl

## 新增root密码
```
sudo passwd
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

## docker安装
```
sh shells/install_docker.sh
```