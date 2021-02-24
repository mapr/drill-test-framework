set -x

cd /tmp/linuxfiles

sudo -u linuxuser1 ./linuxuser_setup.mfs.sh linuxuser1

sudo -u linuxuser1 ./linuxuser1.mfs.cat.sh

sudo -u linuxuser1 ./linuxuser1.mfs.cp.sh

sudo -u linuxuser1 ./linuxuser1.mfs.nox.sh

