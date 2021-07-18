# apt切换阿里源

echo "-------备份sources.list"
cp /etc/apt/sources.list /etc/apt/sources.list.bat
# 获取系统版本代号
version=`lsb_release -c | awk '{print $2}'`
echo "-------切换阿里源"
sed 's/version/'$version'/g' files/ali_sources_list > /etc/apt/sources.list
echo "-------更新软件列表"
sudo apt-get update
echo "-------更新软件包"
sudo apt-get upgrade