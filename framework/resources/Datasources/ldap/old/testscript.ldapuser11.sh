set -x

/bin/rm output11.cat
sudo -u ldapuser11 ./ldapuser11.cat.sh > output11.cat 2>&1
diff ldapuser11.cat.output output11.cat

/bin/rm output11.cp
sudo -u ldapuser11 ./ldapuser11.cp.sh > output11.cp 2>&1
diff ldapuser11.cp.output output11.cp

/bin/rm output11.nox
sudo -u ldapuser11 ./ldapuser11.nox.sh > output11.nox 2>&1
diff ldapuser11.nox.output output11.nox

