  echo -n "Removing Git Old Version... "
  yum remove -y git firewalld
  echo -n "Installing Git New Version... "
  yum install -y https://centos7.iuscommunity.org/ius-release.rpm
  yum install -y git2u
  git --version
  
yum -y install epel-release centos-release-scl wget nano
yum -y install mariadb-devel zlib-devel lua-devel


  echo -n "development tools daki cmake varken cmake3 ü yüklemede hata veriyor o yuzden siliyoruz"
yum remove cmake
  echo -n "cmake3 yukluyoruz"
yum -y install cmake3 
sudo ln -s /usr/bin/cmake3 /usr/bin/cmake

  echo -n "devtoolset-4 ile devtoolset-7 degisim yaptım"
#yum -y install devtoolset-4
yum -y install devtoolset-7

  echo -n "download pvpgn server"
cd /home
git clone https://github.com/pvpgn/pvpgn-server.git
cd pvpgn-server

CC=/opt/rh/devtoolset-7/root/usr/bin/gcc CXX=/opt/rh/devtoolset-7/root/usr/bin/g++ cmake -D WITH_LUA=true -D WITH_MYSQL=true -G "Unix Makefiles" -H./ -B./build
cd build && make
make install


#change bnetd.conf
cd /usr/local/etc/pvpgn/
rm -r -f bnetd.conf
wget https://raw.githubusercontent.com/b1glord/weplay/master/pvpgn/bnetd.conf


cd /usr/local/etc/pvpgn/i18n/trTR
wget https://raw.githubusercontent.com/b1glord/gameconfigs/master/Warcraft%20III/pvpgn/trTR/bnhelp.conf
wget https://raw.githubusercontent.com/b1glord/gameconfigs/master/Warcraft%20III/pvpgn/trTR/bnmotd.txt
wget https://raw.githubusercontent.com/b1glord/gameconfigs/master/Warcraft%20III/pvpgn/trTR/chathelp-war3.txt
wget https://raw.githubusercontent.com/b1glord/gameconfigs/master/Warcraft%20III/pvpgn/trTR/common.xml
wget https://raw.githubusercontent.com/b1glord/gameconfigs/master/Warcraft%20III/pvpgn/trTR/newaccount.txt
wget https://raw.githubusercontent.com/b1glord/gameconfigs/master/Warcraft%20III/pvpgn/trTR/termsofservice.txt
wget https://raw.githubusercontent.com/b1glord/gameconfigs/master/Warcraft%20III/pvpgn/trTR/w3motd.txt


#start server
/usr/local/sbin/bnetd
