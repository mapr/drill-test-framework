set -x

/bin/rm output40.cat
sudo -u linuxuser40 ./linuxuser.cat.sh > output40.cat 2>&1
diff linuxuser40.cat.output output40.cat

/bin/rm output40.cp
sudo -u linuxuser40 ./linuxuser40.cp.sh > output40.cp 2>&1
diff linuxuser40.cp.output output40.cp

/bin/rm output40.nox
sudo -u linuxuser40 ./linuxuser40.nox.sh > output40.nox 2>&1
diff linuxuser40.nox.output output40.nox

