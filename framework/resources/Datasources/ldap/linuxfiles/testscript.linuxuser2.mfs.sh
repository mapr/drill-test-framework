set -x

cd /tmp/linuxfiles

sudo -u linuxuser2 ./linuxuser_setup.mfs.sh linuxuser2

sudo -u linuxuser2 ./linuxuser2.mfs.cat.sh

sudo -u linuxuser2 ./linuxuser2.mfs.cp.sh

sudo -u linuxuser2 ./linuxuser2.mfs.nox.sh

