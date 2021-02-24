set -x

/bin/rm output11.mfs.cat
sudo -u ldapuser11 ./ldapuser11.mfs.cat.sh > output11.mfs.cat 2>&1
diff ldapuser11.mfs.cat.output output11.mfs.cat

/bin/rm output11.mfs.cp
sudo -u ldapuser11 ./ldapuser11.mfs.cp.sh > output11.mfs.cp 2>&1
diff ldapuser11.mfs.cp.output output11.mfs.cp

/bin/rm output11.mfs.nox
sudo -u ldapuser11 ./ldapuser11.mfs.nox.sh > output11.mfs.nox 2>&1
diff ldapuser11.mfs.nox.output output11.mfs.nox

