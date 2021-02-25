set -x

echo $(hostname)

# sudo -u ldapuser1 ./ldapuser_setup.mfs.sh ldapuser1
# ./testscript.ldapuser1.mfs.sh

# sudo -u ldapuser2 ./ldapuser_setup.mfs.sh ldapuser2
# ./testscript.ldapuser2.mfs.sh

# sudo -u ldapuser11 ./ldapuser_setup.mfs.sh ldapuser11
# ./testscript.ldapuser11.mfs.sh

sudo -u ldapuser40 ./ldapuser_setup.mfs.sh ldapuser40
./testscript.ldapuser40.mfs.sh
