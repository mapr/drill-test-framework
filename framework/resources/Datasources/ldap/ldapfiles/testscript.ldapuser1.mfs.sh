set -x

cd /tmp/ldapfiles

sudo -u ldapuser1 ./ldapuser_setup.mfs.sh ldapuser1

sudo -u ldapuser1 ./ldapuser1.mfs.cat.sh

sudo -u ldapuser1 ./ldapuser1.mfs.cp.sh

sudo -u ldapuser1 ./ldapuser1.mfs.nox.sh

