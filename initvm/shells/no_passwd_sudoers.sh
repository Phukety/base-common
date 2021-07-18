# sudo免密配置

sed 's/user/'`who | awk '{print $1}' | awk 'NR==1'`'/g' files/no_passwd_sudoers > /etc/sudoers