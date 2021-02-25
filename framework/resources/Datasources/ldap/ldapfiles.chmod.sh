

set -x

# Datasources/ldap
# total 124
# drwxr-xr-x  5 root root 4096 Jan 25 20:53 .
# drwxr-xr-x  6 root root   92 Jan 25 20:53 ..

chown mapr:mapr testscript.ldapuser11.sh
chown mapr:mapr testscript.ldapuser1.sh
chown mapr:mapr testscript.ldapuser2.sh
chown mapr:mapr testscript.ldapuser40.sh
chown mapr:mapr testscript.mfs.sh
chown mapr:mapr testscript.sh

# Datasources/ldap/ldapfiles:
# total 96
# drwxr-xr-x 14 root      root      4096 Oct  6 21:52 .
# drwxr-xr-x  6 root      root      4096 Jan 25 10:56 ..

chmod 755 ldapfiles/*.sh

chown mapr:mapr ldapfiles/ldapuser11.mfs.cat.sh
chown mapr:mapr ldapfiles/ldapuser11.mfs.cp.sh
chown mapr:mapr ldapfiles/ldapuser11.mfs.nox.sh

chmod 770 ldapfiles/ldapuser1group
chown ldapuser1:ldapuser1 ldapfiles/ldapuser1group

chmod 760 ldapfiles/ldapuser1groupnox
chown ldapuser1:ldapuser1 ldapfiles/ldapuser1groupnox

chown mapr:mapr ldapfiles/ldapuser1.mfs.cat.sh
chown mapr:mapr ldapfiles/ldapuser1.mfs.cp.sh
chown mapr:mapr ldapfiles/ldapuser1.mfs.nox.sh

chmod 777 ldapfiles/ldapuser1other
chown ldapuser1:ldapuser1 ldapfiles/ldapuser1other

chmod 776 ldapfiles/ldapuser1othernox
chown ldapuser1:ldapuser1 ldapfiles/ldapuser1othernox

chmod 700 ldapfiles/ldapuser1owner
chown ldapuser1:ldapuser1 ldapfiles/ldapuser1owner

chmod 600 ldapfiles/ldapuser1ownernox
chown ldapuser1:ldapuser1 ldapfiles/ldapuser1ownernox

chmod 770 ldapfiles/ldapuser2group
chown ldapuser2:ldapuser2 ldapfiles/ldapuser2group

chmod 760 ldapfiles/ldapuser2groupnox
chown ldapuser2:ldapuser2 ldapfiles/ldapuser2groupnox

chown mapr:mapr ldapfiles/ldapuser2.mfs.cat.sh
chown mapr:mapr ldapfiles/ldapuser2.mfs.cp.sh
chown mapr:mapr ldapfiles/ldapuser2.mfs.nox.sh

chmod 777 ldapfiles/ldapuser2other
chown ldapuser2:ldapuser2 ldapfiles/ldapuser2other

chmod 776 ldapfiles/ldapuser2othernox
chown ldapuser2:ldapuser2 ldapfiles/ldapuser2othernox

chmod 700 ldapfiles/ldapuser2owner
chown ldapuser2:ldapuser2 ldapfiles/ldapuser2owner

chmod 600 ldapfiles/ldapuser2ownernox
chown ldapuser2:ldapuser2 ldapfiles/ldapuser2ownernox

chown mapr:mapr ldapfiles/ldapuser40.mfs.cat.sh
chown mapr:mapr ldapfiles/ldapuser40.mfs.cp.sh
chown mapr:mapr ldapfiles/ldapuser40.mfs.nox.sh
chown mapr:mapr ldapfiles/ldapuser_setup.mfs.sh
chown mapr:mapr ldapfiles/ldapuser_setup.sh
chown mapr:mapr ldapfiles/testscript.ldapuser11.mfs.sh
chown mapr:mapr ldapfiles/testscript.ldapuser1.mfs.sh
chown mapr:mapr ldapfiles/testscript.ldapuser2.mfs.sh
chown mapr:mapr ldapfiles/testscript.ldapuser40.mfs.sh

# Datasources/ldap/ldapfiles/ldapuser1group:
# total 28
# drwxrwx---  2 ldapuser1 ldapuser1  138 Sep  3 21:27 .
# drwxr-xr-x 14 root      root      4096 Oct  6 21:52 ..

chown ldapuser1:ldapuser1 ldapfiles/ldapuser1group/ldapuser1group
chmod 770 ldapfiles/ldapuser1group/ldapuser1group

chown ldapuser1:ldapuser1 ldapfiles/ldapuser1group/ldapuser1other
chmod 777 ldapfiles/ldapuser1group/ldapuser1other

chown ldapuser1:ldapuser1 ldapfiles/ldapuser1group/ldapuser1owner
chmod 700 ldapfiles/ldapuser1group/ldapuser1owner

chown ldapuser2:ldapuser2 ldapfiles/ldapuser1group/ldapuser2group
chmod 770 ldapfiles/ldapuser1group/ldapuser2group

chown ldapuser2:ldapuser2 ldapfiles/ldapuser1group/ldapuser2other
chmod 777 ldapfiles/ldapuser1group/ldapuser2other

chown ldapuser2:ldapuser2 ldapfiles/ldapuser1group/ldapuser2owner
chmod 700 ldapfiles/ldapuser1group/ldapuser2owner

# Datasources/ldap/ldapfiles/ldapuser1groupnox:
# total 28
# drwxrw----  2 ldapuser1 ldapuser1  138 Aug 26 18:10 .
# drwxr-xr-x 14 root      root      4096 Oct  6 21:52 ..

chown ldapuser1:ldapuser1 ldapfiles/ldapuser1groupnox/ldapuser1group
chmod 770 ldapfiles/ldapuser1groupnox/ldapuser1group

chown ldapuser1:ldapuser1 ldapfiles/ldapuser1groupnox/ldapuser1other
chmod 777 ldapfiles/ldapuser1groupnox/ldapuser1other

chown ldapuser1:ldapuser1 ldapfiles/ldapuser1groupnox/ldapuser1owner
chmod 700 ldapfiles/ldapuser1groupnox/ldapuser1owner

chown ldapuser2:ldapuser2 ldapfiles/ldapuser1groupnox/ldapuser2group
chmod 770 ldapfiles/ldapuser1groupnox/ldapuser2group

chown ldapuser2:ldapuser2 ldapfiles/ldapuser1groupnox/ldapuser2other
chmod 777 ldapfiles/ldapuser1groupnox/ldapuser2other

chown ldapuser2:ldapuser2 ldapfiles/ldapuser1groupnox/ldapuser2owner
chmod 700 ldapfiles/ldapuser1groupnox/ldapuser2owner

# Datasources/ldap/ldapfiles/ldapuser1other:
# total 28
# drwxrwxrwx  2 ldapuser1 ldapuser1  138 Sep  3 21:27 .
# drwxr-xr-x 14 root      root      4096 Oct  6 21:52 ..

chown ldapuser1:ldapuser1 ldapfiles/ldapuser1other/ldapuser1group
chmod 770 ldapfiles/ldapuser1other/ldapuser1group

chown ldapuser1:ldapuser1 ldapfiles/ldapuser1other/ldapuser1other
chmod 777 ldapfiles/ldapuser1other/ldapuser1other

chown ldapuser1:ldapuser1 ldapfiles/ldapuser1other/ldapuser1owner
chmod 700 ldapfiles/ldapuser1other/ldapuser1owner

chown ldapuser2:ldapuser2 ldapfiles/ldapuser1other/ldapuser2group
chmod 770 ldapfiles/ldapuser1other/ldapuser2group

chown ldapuser2:ldapuser2 ldapfiles/ldapuser1other/ldapuser2other
chmod 777 ldapfiles/ldapuser1other/ldapuser2other

chown ldapuser2:ldapuser2 ldapfiles/ldapuser1other/ldapuser2owner
chmod 700 ldapfiles/ldapuser1other/ldapuser2owner


# Datasources/ldap/ldapfiles/ldapuser1othernox:
# total 28
# drwxrwxrw-  2 ldapuser1 ldapuser1  138 Aug 26 18:10 .
# drwxr-xr-x 14 root      root      4096 Oct  6 21:52 ..

chown ldapuser1:ldapuser1 ldapfiles/ldapuser1othernox/ldapuser1group
chmod 770 ldapfiles/ldapuser1othernox/ldapuser1group

chown ldapuser1:ldapuser1 ldapfiles/ldapuser1othernox/ldapuser1other
chmod 777 ldapfiles/ldapuser1othernox/ldapuser1other

chown ldapuser1:ldapuser1 ldapfiles/ldapuser1othernox/ldapuser1owner
chmod 700 ldapfiles/ldapuser1othernox/ldapuser1owner

chown ldapuser2:ldapuser2 ldapfiles/ldapuser1othernox/ldapuser2group
chmod 770 ldapfiles/ldapuser1othernox/ldapuser2group

chown ldapuser2:ldapuser2 ldapfiles/ldapuser1othernox/ldapuser2other
chmod 777 ldapfiles/ldapuser1othernox/ldapuser2other

chown ldapuser2:ldapuser2 ldapfiles/ldapuser1othernox/ldapuser2owner
chmod 700 ldapfiles/ldapuser1othernox/ldapuser2owner

# Datasources/ldap/ldapfiles/ldapuser1owner:
# total 28
# drwx------  2 ldapuser1 ldapuser1  138 Sep  3 21:27 .
# drwxr-xr-x 14 root      root      4096 Oct  6 21:52 ..

chown ldapuser1:ldapuser1 ldapfiles/ldapuser1owner/ldapuser1group
chmod 770 ldapfiles/ldapuser1owner/ldapuser1group

chown ldapuser1:ldapuser1 ldapfiles/ldapuser1owner/ldapuser1other
chmod 777 ldapfiles/ldapuser1owner/ldapuser1other

chown ldapuser1:ldapuser1 ldapfiles/ldapuser1owner/ldapuser1owner
chmod 700 ldapfiles/ldapuser1owner/ldapuser1owner

chown ldapuser2:ldapuser2 ldapfiles/ldapuser1owner/ldapuser2group
chmod 770 ldapfiles/ldapuser1owner/ldapuser2group

chown ldapuser2:ldapuser2 ldapfiles/ldapuser1owner/ldapuser2other
chmod 777 ldapfiles/ldapuser1owner/ldapuser2other

chown ldapuser2:ldapuser2 ldapfiles/ldapuser1owner/ldapuser2owner
chmod 700 ldapfiles/ldapuser1owner/ldapuser2owner

# Datasources/ldap/ldapfiles/ldapuser1ownernox:
# total 28
# drw-------  2 ldapuser1 ldapuser1  138 Aug 26 18:10 .
# drwxr-xr-x 14 root      root      4096 Oct  6 21:52 ..

chown ldapuser1:ldapuser1 ldapfiles/ldapuser1ownernox/ldapuser1group
chmod 770 ldapfiles/ldapuser1ownernox/ldapuser1group

chown ldapuser1:ldapuser1 ldapfiles/ldapuser1ownernox/ldapuser1other
chmod 777 ldapfiles/ldapuser1ownernox/ldapuser1other

chown ldapuser1:ldapuser1 ldapfiles/ldapuser1ownernox/ldapuser1owner
chmod 700 ldapfiles/ldapuser1ownernox/ldapuser1owner

chown ldapuser2:ldapuser2 ldapfiles/ldapuser1ownernox/ldapuser2group
chmod 770 ldapfiles/ldapuser1ownernox/ldapuser2group

chown ldapuser2:ldapuser2 ldapfiles/ldapuser1ownernox/ldapuser2other
chmod 777 ldapfiles/ldapuser1ownernox/ldapuser2other

chown ldapuser2:ldapuser2 ldapfiles/ldapuser1ownernox/ldapuser2owner
chmod 700 ldapfiles/ldapuser1ownernox/ldapuser2owner

# Datasources/ldap/ldapfiles/ldapuser2group:
# total 28
# drwxrwx---  2 ldapuser2 ldapuser2  138 Sep  3 21:27 .
# drwxr-xr-x 14 root      root      4096 Oct  6 21:52 ..

chown ldapuser1:ldapuser1 ldapfiles/ldapuser2group/ldapuser1group
chmod 770 ldapfiles/ldapuser2group/ldapuser1group

chown ldapuser1:ldapuser1 ldapfiles/ldapuser2group/ldapuser1other
chmod 777 ldapfiles/ldapuser2group/ldapuser1other

chown ldapuser1:ldapuser1 ldapfiles/ldapuser2group/ldapuser1owner
chmod 700 ldapfiles/ldapuser2group/ldapuser1owner

chown ldapuser2:ldapuser2 ldapfiles/ldapuser2group/ldapuser2group
chmod 770 ldapfiles/ldapuser2group/ldapuser2group

chown ldapuser2:ldapuser2 ldapfiles/ldapuser2group/ldapuser2other
chmod 777 ldapfiles/ldapuser2group/ldapuser2other

chown ldapuser2:ldapuser2 ldapfiles/ldapuser2group/ldapuser2owner
chmod 700 ldapfiles/ldapuser2group/ldapuser2owner

# Datasources/ldap/ldapfiles/ldapuser2groupnox:
# total 28
# drwxrw----  2 ldapuser2 ldapuser2  138 Aug 26 18:11 .
# drwxr-xr-x 14 root      root      4096 Oct  6 21:52 ..

chown ldapuser1:ldapuser1 ldapfiles/ldapuser2groupnox/ldapuser1group
chmod 770 ldapfiles/ldapuser2groupnox/ldapuser1group

chown ldapuser1:ldapuser1 ldapfiles/ldapuser2groupnox/ldapuser1other
chmod 777 ldapfiles/ldapuser2groupnox/ldapuser1other

chown ldapuser1:ldapuser1 ldapfiles/ldapuser2groupnox/ldapuser1owner
chmod 700 ldapfiles/ldapuser2groupnox/ldapuser1owner

chown ldapuser2:ldapuser2 ldapfiles/ldapuser2groupnox/ldapuser2group
chmod 770 ldapfiles/ldapuser2groupnox/ldapuser2group

chown ldapuser2:ldapuser2 ldapfiles/ldapuser2groupnox/ldapuser2other
chmod 777 ldapfiles/ldapuser2groupnox/ldapuser2other

chown ldapuser2:ldapuser2 ldapfiles/ldapuser2groupnox/ldapuser2owner
chmod 700 ldapfiles/ldapuser2groupnox/ldapuser2owner

# Datasources/ldap/ldapfiles/ldapuser2other:
# total 28
# drwxrwxrwx  2 ldapuser2 ldapuser2  138 Sep  3 21:27 .
# drwxr-xr-x 14 root      root      4096 Oct  6 21:52 ..

chown ldapuser1:ldapuser1 ldapfiles/ldapuser2other/ldapuser1group
chmod 770 ldapfiles/ldapuser2other/ldapuser1group

chown ldapuser1:ldapuser1 ldapfiles/ldapuser2other/ldapuser1other
chmod 777 ldapfiles/ldapuser2other/ldapuser1other

chown ldapuser1:ldapuser1 ldapfiles/ldapuser2other/ldapuser1owner
chmod 700 ldapfiles/ldapuser2other/ldapuser1owner

chown ldapuser2:ldapuser2 ldapfiles/ldapuser2other/ldapuser2group
chmod 770 ldapfiles/ldapuser2other/ldapuser2group

chown ldapuser2:ldapuser2 ldapfiles/ldapuser2other/ldapuser2other
chmod 777 ldapfiles/ldapuser2other/ldapuser2other

chown ldapuser2:ldapuser2 ldapfiles/ldapuser2other/ldapuser2owner
chmod 700 ldapfiles/ldapuser2other/ldapuser2owner

# Datasources/ldap/ldapfiles/ldapuser2othernox:
# total 28
# drwxrwxrw-  2 ldapuser2 ldapuser2  138 Aug 26 18:11 .
# drwxr-xr-x 14 root      root      4096 Oct  6 21:52 ..

chown ldapuser1:ldapuser1 ldapfiles/ldapuser2othernox/ldapuser1group
chmod 770 ldapfiles/ldapuser2othernox/ldapuser1group

chown ldapuser1:ldapuser1 ldapfiles/ldapuser2othernox/ldapuser1other
chmod 777 ldapfiles/ldapuser2othernox/ldapuser1other

chown ldapuser1:ldapuser1 ldapfiles/ldapuser2othernox/ldapuser1owner
chmod 700 ldapfiles/ldapuser2othernox/ldapuser1owner

chown ldapuser2:ldapuser2 ldapfiles/ldapuser2othernox/ldapuser2group
chmod 770 ldapfiles/ldapuser2othernox/ldapuser2group

chown ldapuser2:ldapuser2 ldapfiles/ldapuser2othernox/ldapuser2other
chmod 777 ldapfiles/ldapuser2othernox/ldapuser2other

chown ldapuser2:ldapuser2 ldapfiles/ldapuser2othernox/ldapuser2owner
chmod 700 ldapfiles/ldapuser2othernox/ldapuser2owner

# Datasources/ldap/ldapfiles/ldapuser2owner:
# total 28
# drwx------  2 ldapuser2 ldapuser2  138 Sep  3 21:27 .
# drwxr-xr-x 14 root      root      4096 Oct  6 21:52 ..

chown ldapuser1:ldapuser1 ldapfiles/ldapuser2owner/ldapuser1group
chmod 770 ldapfiles/ldapuser2owner/ldapuser1group

chown ldapuser1:ldapuser1 ldapfiles/ldapuser2owner/ldapuser1other
chmod 777 ldapfiles/ldapuser2owner/ldapuser1other

chown ldapuser1:ldapuser1 ldapfiles/ldapuser2owner/ldapuser1owner
chmod 700 ldapfiles/ldapuser2owner/ldapuser1owner

chown ldapuser2:ldapuser2 ldapfiles/ldapuser2owner/ldapuser2group
chmod 770 ldapfiles/ldapuser2owner/ldapuser2group

chown ldapuser2:ldapuser2 ldapfiles/ldapuser2owner/ldapuser2other
chmod 777 ldapfiles/ldapuser2owner/ldapuser2other

chown ldapuser2:ldapuser2 ldapfiles/ldapuser2owner/ldapuser2owner
chmod 700 ldapfiles/ldapuser2owner/ldapuser2owner

# Datasources/ldap/ldapfiles/ldapuser2ownernox:
# total 28
# drw-------  2 ldapuser2 ldapuser2  138 Aug 26 18:11 .
# drwxr-xr-x 14 root      root      4096 Oct  6 21:52 ..

chown ldapuser1:ldapuser1 ldapfiles/ldapuser2ownernox/ldapuser1group
chmod 770 ldapfiles/ldapuser2ownernox/ldapuser1group

chown ldapuser1:ldapuser1 ldapfiles/ldapuser2ownernox/ldapuser1other
chmod 777 ldapfiles/ldapuser2ownernox/ldapuser1other

chown ldapuser1:ldapuser1 ldapfiles/ldapuser2ownernox/ldapuser1owner
chmod 700 ldapfiles/ldapuser2ownernox/ldapuser1owner

chown ldapuser2:ldapuser2 ldapfiles/ldapuser2ownernox/ldapuser2group
chmod 770 ldapfiles/ldapuser2ownernox/ldapuser2group

chown ldapuser2:ldapuser2 ldapfiles/ldapuser2ownernox/ldapuser2other
chmod 777 ldapfiles/ldapuser2ownernox/ldapuser2other

chown ldapuser2:ldapuser2 ldapfiles/ldapuser2ownernox/ldapuser2owner
chmod 700 ldapfiles/ldapuser2ownernox/ldapuser2owner
