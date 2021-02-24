set -x

cd /tmp/ldapfiles

sudo -u ldapuser11 ./ldapuser_setup.mfs.sh ldapuser11

sudo -u ldapuser11 ./ldapuser11.mfs.cat.sh

sudo -u ldapuser11 ./ldapuser11.mfs.cp.sh

sudo -u ldapuser11 ./ldapuser11.mfs.nox.sh

