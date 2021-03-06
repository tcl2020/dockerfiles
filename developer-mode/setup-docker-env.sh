apt-get update -qq

DEBIAN_FRONTEND=noninteractive apt-get upgrade -q -y -u \
	       -o Dpkg::Options::=--force-confold \
	       -o Dpkg::Options::=--force-confdef \
	       --allow-downgrades --allow-remove-essential --allow-change-held-packages

apt-get install -y git gcc-8 g++-8 make curl automake autoconf \
    minizip vim libreadline-dev libtool python3-pip python3-venv \
    libssl-dev openssl libpq-dev libzookeeper-mt-dev \
    libboost-all-dev libuv1-dev swig3.0 libyajl-dev \
    libgd-dev pkg-config gdb libcurl4-openssl-dev \
    libmemcached-dev libxml2-dev libxslt-dev apache2-dev apache2 \
    libgeos-dev libproj-dev libbsd-dev lsb-release

pip3 install "cmake==3.17.2"

update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-8 60 --slave /usr/bin/g++ g++ /usr/bin/g++-8
update-alternatives --set cc /usr/bin/gcc-8
update-alternatives --set c++ /usr/bin/g++-8

dpkg-query -l 2>&1 | sed "s,^,package-selections: ,"
