set -x

/bin/rm output11.cat
sudo -u linuxuser11 ./linuxuser11.cat.sh > output11.cat 2>&1
diff linuxuser11.cat.output output11.cat

/bin/rm output11.cp
sudo -u linuxuser11 ./linuxuser11.cp.sh > output11.cp 2>&1
diff linuxuser11.cp.output output11.cp

/bin/rm output11.nox
sudo -u linuxuser11 ./linuxuser11.nox.sh > output11.nox 2>&1
diff linuxuser11.nox.output output11.nox

