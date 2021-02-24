set -x

/bin/rm output1.cat
sudo -u linuxuser1 ./linuxuser1.cat.sh > output1.cat 2>&1
diff linuxuser1.cat.output output1.cat

/bin/rm output1.cp
sudo -u linuxuser1 ./linuxuser1.cp.sh > output1.cp 2>&1
diff linuxuser1.cp.output output1.cp

/bin/rm output1.nox
sudo -u linuxuser1 ./linuxuser1.nox.sh > output1.nox 2>&1
diff linuxuser1.nox.output output1.nox

