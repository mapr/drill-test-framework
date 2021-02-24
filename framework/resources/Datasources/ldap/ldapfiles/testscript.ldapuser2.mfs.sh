set -x

cd /tmp/ldapfiles

sudo -u ldapuser2 ./ldapuser_setup.mfs.sh ldapuser2

sudo -u ldapuser2 ./ldapuser2.mfs.cat.sh

sudo -u ldapuser2 ./ldapuser2.mfs.cp.sh

sudo -u ldapuser2 ./ldapuser2.mfs.nox.sh

