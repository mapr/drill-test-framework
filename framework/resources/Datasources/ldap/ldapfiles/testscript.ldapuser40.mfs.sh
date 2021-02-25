set -x

cd /tmp/ldapfiles

sudo -u ldapuser40 ./ldapuser_setup.mfs.sh ldapuser40

sudo -u ldapuser40 ./ldapuser40.mfs.cat.sh

sudo -u ldapuser40 ./ldapuser40.mfs.cp.sh

sudo -u ldapuser40 ./ldapuser40.mfs.nox.sh

