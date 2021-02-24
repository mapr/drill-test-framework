
set -x

# Datasources/ldap/linuxfiles:
# total 96
# drwxr-xr-x 14 root      root      4096 Oct  6 21:52 .
# drwxr-xr-x  6 root      root      4096 Jan 25 10:56 ..

chmod 755 linuxfiles/*.sh

chown mapr:mapr linuxfiles/linuxuser11.cat.sh
chown mapr:mapr linuxfiles/linuxuser11.cp.sh
chown mapr:mapr linuxfiles/linuxuser11.mfs.cat.sh
chown mapr:mapr linuxfiles/linuxuser11.mfs.cp.sh
chown mapr:mapr linuxfiles/linuxuser11.mfs.nox.sh
chown mapr:mapr linuxfiles/linuxuser11.nox.sh

chmod 770 linuxfiles/linuxuser1group
chown linuxuser1:linuxuser1 linuxfiles/linuxuser1group

chmod 760 linuxfiles/linuxuser1groupnox
chown linuxuser1:linuxuser1 linuxfiles/linuxuser1groupnox

chown mapr:mapr linuxfiles/linuxuser1.cat.sh
chown mapr:mapr linuxfiles/linuxuser1.cp.sh
chown mapr:mapr linuxfiles/linuxuser1.mfs.cat.sh
chown mapr:mapr linuxfiles/linuxuser1.mfs.cp.sh
chown mapr:mapr linuxfiles/linuxuser1.mfs.nox.sh
chown mapr:mapr linuxfiles/linuxuser1.nox.sh

chmod 777 linuxfiles/linuxuser1other
chown linuxuser1:linuxuser1 linuxfiles/linuxuser1other

chmod 776 linuxfiles/linuxuser1othernox
chown linuxuser1:linuxuser1 linuxfiles/linuxuser1othernox

chmod 700 linuxfiles/linuxuser1owner
chown linuxuser1:linuxuser1 linuxfiles/linuxuser1owner

chmod 600 linuxfiles/linuxuser1ownernox
chown linuxuser1:linuxuser1 linuxfiles/linuxuser1ownernox

chmod 770 linuxfiles/linuxuser2group
chown linuxuser2:linuxuser2 linuxfiles/linuxuser2group

chmod 760 linuxfiles/linuxuser2groupnox
chown linuxuser2:linuxuser2 linuxfiles/linuxuser2groupnox

chown mapr:mapr linuxfiles/linuxuser2.cat.sh
chown mapr:mapr linuxfiles/linuxuser2.cp.sh
chown mapr:mapr linuxfiles/linuxuser2.mfs.cat.sh
chown mapr:mapr linuxfiles/linuxuser2.mfs.cp.sh
chown mapr:mapr linuxfiles/linuxuser2.mfs.nox.sh
chown mapr:mapr linuxfiles/linuxuser2.nox.sh

chmod 777 linuxfiles/linuxuser2other
chown linuxuser2:linuxuser2 linuxfiles/linuxuser2other

chmod 776 linuxfiles/linuxuser2othernox
chown linuxuser2:linuxuser2 linuxfiles/linuxuser2othernox

chmod 700 linuxfiles/linuxuser2owner
chown linuxuser2:linuxuser2 linuxfiles/linuxuser2owner

chmod 600 linuxfiles/linuxuser2ownernox
chown linuxuser2:linuxuser2 linuxfiles/linuxuser2ownernox

chown mapr:mapr linuxfiles/linuxuser40.cat.sh
chown mapr:mapr linuxfiles/linuxuser40.cp.sh
chown mapr:mapr linuxfiles/linuxuser40.mfs.cat.sh
chown mapr:mapr linuxfiles/linuxuser40.mfs.cp.sh
chown mapr:mapr linuxfiles/linuxuser40.mfs.nox.sh
chown mapr:mapr linuxfiles/linuxuser40.nox.sh
chown mapr:mapr linuxfiles/linuxuser_setup.mfs.sh
chown mapr:mapr linuxfiles/linuxuser_setup.sh
chown mapr:mapr linuxfiles/testscript.linuxuser11.mfs.sh
chown mapr:mapr linuxfiles/testscript.linuxuser11.sh
chown mapr:mapr linuxfiles/testscript.linuxuser1.mfs.sh
chown mapr:mapr linuxfiles/testscript.linuxuser1.sh
chown mapr:mapr linuxfiles/testscript.linuxuser2.mfs.sh
chown mapr:mapr linuxfiles/testscript.linuxuser2.sh
chown mapr:mapr linuxfiles/testscript.linuxuser40.mfs.sh
chown mapr:mapr linuxfiles/testscript.linuxuser40.sh

# Datasources/ldap/linuxfiles/linuxuser1group:
# total 28
# drwxrwx---  2 linuxuser1 linuxuser1  138 Sep  3 21:27 .
# drwxr-xr-x 14 root      root      4096 Oct  6 21:52 ..

chown linuxuser1:linuxuser1 linuxfiles/linuxuser1group/linuxuser1group
chmod 770 linuxfiles/linuxuser1group/linuxuser1group

chown linuxuser1:linuxuser1 linuxfiles/linuxuser1group/linuxuser1other
chmod 777 linuxfiles/linuxuser1group/linuxuser1other

chown linuxuser1:linuxuser1 linuxfiles/linuxuser1group/linuxuser1owner
chmod 700 linuxfiles/linuxuser1group/linuxuser1owner

chown linuxuser2:linuxuser2 linuxfiles/linuxuser1group/linuxuser2group
chmod 770 linuxfiles/linuxuser1group/linuxuser2group

chown linuxuser2:linuxuser2 linuxfiles/linuxuser1group/linuxuser2other
chmod 777 linuxfiles/linuxuser1group/linuxuser2other

chown linuxuser2:linuxuser2 linuxfiles/linuxuser1group/linuxuser2owner
chmod 700 linuxfiles/linuxuser1group/linuxuser2owner

# Datasources/ldap/linuxfiles/linuxuser1groupnox:
# total 2linux
# drwxrw----  2 linuxuser1 linuxuser1  138 Aug 26 18:10 .
# drwxr-xr-x 14 root      root      4096 Oct  6 21:52 ..

chown linuxuser1:linuxuser1 linuxfiles/linuxuser1groupnox/linuxuser1group
chmod 770 linuxfiles/linuxuser1groupnox/linuxuser1group

chown linuxuser1:linuxuser1 linuxfiles/linuxuser1groupnox/linuxuser1other
chmod 777 linuxfiles/linuxuser1groupnox/linuxuser1other

chown linuxuser1:linuxuser1 linuxfiles/linuxuser1groupnox/linuxuser1owner
chmod 700 linuxfiles/linuxuser1groupnox/linuxuser1owner

chown linuxuser2:linuxuser2 linuxfiles/linuxuser1groupnox/linuxuser2group
chmod 770 linuxfiles/linuxuser1groupnox/linuxuser2group

chown linuxuser2:linuxuser2 linuxfiles/linuxuser1groupnox/linuxuser2other
chmod 777 linuxfiles/linuxuser1groupnox/linuxuser2other

chown linuxuser2:linuxuser2 linuxfiles/linuxuser1groupnox/linuxuser2owner
chmod 700 linuxfiles/linuxuser1groupnox/linuxuser2owner

# Datasources/ldap/linuxfiles/linuxuser1other:
# total 28
# drwxrwxrwx  2 linuxuser1 linuxuser1  138 Sep  3 21:27 .
# drwxr-xr-x 14 root      root      4096 Oct  6 21:52 ..

chown linuxuser1:linuxuser1 linuxfiles/linuxuser1other/linuxuser1group
chmod 770 linuxfiles/linuxuser1other/linuxuser1group

chown linuxuser1:linuxuser1 linuxfiles/linuxuser1other/linuxuser1other
chmod 777 linuxfiles/linuxuser1other/linuxuser1other

chown linuxuser1:linuxuser1 linuxfiles/linuxuser1other/linuxuser1owner
chmod 700 linuxfiles/linuxuser1other/linuxuser1owner

chown linuxuser2:linuxuser2 linuxfiles/linuxuser1other/linuxuser2group
chmod 770 linuxfiles/linuxuser1other/linuxuser2group

chown linuxuser2:linuxuser2 linuxfiles/linuxuser1other/linuxuser2other
chmod 777 linuxfiles/linuxuser1other/linuxuser2other

chown linuxuser2:linuxuser2 linuxfiles/linuxuser1other/linuxuser2owner
chmod 700 linuxfiles/linuxuser1other/linuxuser2owner


# Datasources/ldap/linuxfiles/linuxuser1othernox:
# total 28
# drwxrwxrw-  2 linuxuser1 linuxuser1  138 Aug 26 18:10 .
# drwxr-xr-x 14 root      root      4096 Oct  6 21:52 ..

chown linuxuser1:linuxuser1 linuxfiles/linuxuser1othernox/linuxuser1group
chmod 770 linuxfiles/linuxuser1othernox/linuxuser1group

chown linuxuser1:linuxuser1 linuxfiles/linuxuser1othernox/linuxuser1other
chmod 777 linuxfiles/linuxuser1othernox/linuxuser1other

chown linuxuser1:linuxuser1 linuxfiles/linuxuser1othernox/linuxuser1owner
chmod 700 linuxfiles/linuxuser1othernox/linuxuser1owner

chown linuxuser2:linuxuser2 linuxfiles/linuxuser1othernox/linuxuser2group
chmod 770 linuxfiles/linuxuser1othernox/linuxuser2group

chown linuxuser2:linuxuser2 linuxfiles/linuxuser1othernox/linuxuser2other
chmod 777 linuxfiles/linuxuser1othernox/linuxuser2other

chown linuxuser2:linuxuser2 linuxfiles/linuxuser1othernox/linuxuser2owner
chmod 700 linuxfiles/linuxuser1othernox/linuxuser2owner

# Datasources/ldap/linuxfiles/linuxuser1owner:
# total 28
# drwx------  2 linuxuser1 linuxuser1  138 Sep  3 21:27 .
# drwxr-xr-x 14 root      root      4096 Oct  6 21:52 ..

chown linuxuser1:linuxuser1 linuxfiles/linuxuser1owner/linuxuser1group
chmod 770 linuxfiles/linuxuser1owner/linuxuser1group

chown linuxuser1:linuxuser1 linuxfiles/linuxuser1owner/linuxuser1other
chmod 777 linuxfiles/linuxuser1owner/linuxuser1other

chown linuxuser1:linuxuser1 linuxfiles/linuxuser1owner/linuxuser1owner
chmod 700 linuxfiles/linuxuser1owner/linuxuser1owner

chown linuxuser2:linuxuser2 linuxfiles/linuxuser1owner/linuxuser2group
chmod 770 linuxfiles/linuxuser1owner/linuxuser2group

chown linuxuser2:linuxuser2 linuxfiles/linuxuser1owner/linuxuser2other
chmod 777 linuxfiles/linuxuser1owner/linuxuser2other

chown linuxuser2:linuxuser2 linuxfiles/linuxuser1owner/linuxuser2owner
chmod 700 linuxfiles/linuxuser1owner/linuxuser2owner

# Datasources/ldap/linuxfiles/linuxuser1ownernox:
# total 28
# drw-------  2 linuxuser1 linuxuser1  138 Aug 26 18:10 .
# drwxr-xr-x 14 root      root      4096 Oct  6 21:52 ..

chown linuxuser1:linuxuser1 linuxfiles/linuxuser1ownernox/linuxuser1group
chmod 770 linuxfiles/linuxuser1ownernox/linuxuser1group

chown linuxuser1:linuxuser1 linuxfiles/linuxuser1ownernox/linuxuser1other
chmod 777 linuxfiles/linuxuser1ownernox/linuxuser1other

chown linuxuser1:linuxuser1 linuxfiles/linuxuser1ownernox/linuxuser1owner
chmod 700 linuxfiles/linuxuser1ownernox/linuxuser1owner

chown linuxuser2:linuxuser2 linuxfiles/linuxuser1ownernox/linuxuser2group
chmod 770 linuxfiles/linuxuser1ownernox/linuxuser2group

chown linuxuser2:linuxuser2 linuxfiles/linuxuser1ownernox/linuxuser2other
chmod 777 linuxfiles/linuxuser1ownernox/linuxuser2other

chown linuxuser2:linuxuser2 linuxfiles/linuxuser1ownernox/linuxuser2owner
chmod 700 linuxfiles/linuxuser1ownernox/linuxuser2owner

# Datasources/ldap/linuxfiles/linuxuser2group:
# total 28
# drwxrwx---  2 linuxuser2 linuxuser2  138 Sep  3 21:27 .
# drwxr-xr-x 14 root      root      4096 Oct  6 21:52 ..

chown linuxuser1:linuxuser1 linuxfiles/linuxuser2group/linuxuser1group
chmod 770 linuxfiles/linuxuser2group/linuxuser1group

chown linuxuser1:linuxuser1 linuxfiles/linuxuser2group/linuxuser1other
chmod 777 linuxfiles/linuxuser2group/linuxuser1other

chown linuxuser1:linuxuser1 linuxfiles/linuxuser2group/linuxuser1owner
chmod 700 linuxfiles/linuxuser2group/linuxuser1owner

chown linuxuser2:linuxuser2 linuxfiles/linuxuser2group/linuxuser2group
chmod 770 linuxfiles/linuxuser2group/linuxuser2group

chown linuxuser2:linuxuser2 linuxfiles/linuxuser2group/linuxuser2other
chmod 777 linuxfiles/linuxuser2group/linuxuser2other

chown linuxuser2:linuxuser2 linuxfiles/linuxuser2group/linuxuser2owner
chmod 700 linuxfiles/linuxuser2group/linuxuser2owner

# Datasources/ldap/linuxfiles/linuxuser2groupnox:
# total 28
# drwxrw----  2 linuxuser2 linuxuser2  138 Aug 26 18:11 .
# drwxr-xr-x 14 root      root      4096 Oct  6 21:52 ..

chown linuxuser1:linuxuser1 linuxfiles/linuxuser2groupnox/linuxuser1group
chmod 770 linuxfiles/linuxuser2groupnox/linuxuser1group

chown linuxuser1:linuxuser1 linuxfiles/linuxuser2groupnox/linuxuser1other
chmod 777 linuxfiles/linuxuser2groupnox/linuxuser1other

chown linuxuser1:linuxuser1 linuxfiles/linuxuser2groupnox/linuxuser1owner
chmod 700 linuxfiles/linuxuser2groupnox/linuxuser1owner

chown linuxuser2:linuxuser2 linuxfiles/linuxuser2groupnox/linuxuser2group
chmod 770 linuxfiles/linuxuser2groupnox/linuxuser2group

chown linuxuser2:linuxuser2 linuxfiles/linuxuser2groupnox/linuxuser2other
chmod 777 linuxfiles/linuxuser2groupnox/linuxuser2other

chown linuxuser2:linuxuser2 linuxfiles/linuxuser2groupnox/linuxuser2owner
chmod 700 linuxfiles/linuxuser2groupnox/linuxuser2owner

# Datasources/ldap/linuxfiles/linuxuser2other:
# total 28
# drwxrwxrwx  2 linuxuser2 linuxuser2  138 Sep  3 21:27 .
# drwxr-xr-x 14 root      root      4096 Oct  6 21:52 ..

chown linuxuser1:linuxuser1 linuxfiles/linuxuser2other/linuxuser1group
chmod 770 linuxfiles/linuxuser2other/linuxuser1group

chown linuxuser1:linuxuser1 linuxfiles/linuxuser2other/linuxuser1other
chmod 777 linuxfiles/linuxuser2other/linuxuser1other

chown linuxuser1:linuxuser1 linuxfiles/linuxuser2other/linuxuser1owner
chmod 700 linuxfiles/linuxuser2other/linuxuser1owner

chown linuxuser2:linuxuser2 linuxfiles/linuxuser2other/linuxuser2group
chmod 770 linuxfiles/linuxuser2other/linuxuser2group

chown linuxuser2:linuxuser2 linuxfiles/linuxuser2other/linuxuser2other
chmod 777 linuxfiles/linuxuser2other/linuxuser2other

chown linuxuser2:linuxuser2 linuxfiles/linuxuser2other/linuxuser2owner
chmod 700 linuxfiles/linuxuser2other/linuxuser2owner

# Datasources/ldap/linuxfiles/linuxuser2othernox:
# total 28
# drwxrwxrw-  2 linuxuser2 linuxuser2  138 Aug 26 18:11 .
# drwxr-xr-x 14 root      root      4096 Oct  6 21:52 ..

chown linuxuser1:linuxuser1 linuxfiles/linuxuser2othernox/linuxuser1group
chmod 770 linuxfiles/linuxuser2othernox/linuxuser1group

chown linuxuser1:linuxuser1 linuxfiles/linuxuser2othernox/linuxuser1other
chmod 777 linuxfiles/linuxuser2othernox/linuxuser1other

chown linuxuser1:linuxuser1 linuxfiles/linuxuser2othernox/linuxuser1owner
chmod 700 linuxfiles/linuxuser2othernox/linuxuser1owner

chown linuxuser2:linuxuser2 linuxfiles/linuxuser2othernox/linuxuser2group
chmod 770 linuxfiles/linuxuser2othernox/linuxuser2group

chown linuxuser2:linuxuser2 linuxfiles/linuxuser2othernox/linuxuser2other
chmod 777 linuxfiles/linuxuser2othernox/linuxuser2other

chown linuxuser2:linuxuser2 linuxfiles/linuxuser2othernox/linuxuser2owner
chmod 700 linuxfiles/linuxuser2othernox/linuxuser2owner

# Datasources/ldap/linuxfiles/linuxuser2owner:
# total 28
# drwx------  2 linuxuser2 linuxuser2  138 Sep  3 21:27 .
# drwxr-xr-x 14 root      root      4096 Oct  6 21:52 ..

chown linuxuser1:linuxuser1 linuxfiles/linuxuser2owner/linuxuser1group
chmod 770 linuxfiles/linuxuser2owner/linuxuser1group

chown linuxuser1:linuxuser1 linuxfiles/linuxuser2owner/linuxuser1other
chmod 777 linuxfiles/linuxuser2owner/linuxuser1other

chown linuxuser1:linuxuser1 linuxfiles/linuxuser2owner/linuxuser1owner
chmod 700 linuxfiles/linuxuser2owner/linuxuser1owner

chown linuxuser2:linuxuser2 linuxfiles/linuxuser2owner/linuxuser2group
chmod 770 linuxfiles/linuxuser2owner/linuxuser2group

chown linuxuser2:linuxuser2 linuxfiles/linuxuser2owner/linuxuser2other
chmod 777 linuxfiles/linuxuser2owner/linuxuser2other

chown linuxuser2:linuxuser2 linuxfiles/linuxuser2owner/linuxuser2owner
chmod 700 linuxfiles/linuxuser2owner/linuxuser2owner

# Datasources/ldap/linuxfiles/linuxuser2ownernox:
# total 28
# drw-------  2 linuxuser2 linuxuser2  138 Aug 26 18:11 .
# drwxr-xr-x 14 root      root      4096 Oct  6 21:52 ..

chown linuxuser1:linuxuser1 linuxfiles/linuxuser2ownernox/linuxuser1group
chmod 770 linuxfiles/linuxuser2ownernox/linuxuser1group

chown linuxuser1:linuxuser1 linuxfiles/linuxuser2ownernox/linuxuser1other
chmod 777 linuxfiles/linuxuser2ownernox/linuxuser1other

chown linuxuser1:linuxuser1 linuxfiles/linuxuser2ownernox/linuxuser1owner
chmod 700 linuxfiles/linuxuser2ownernox/linuxuser1owner

chown linuxuser2:linuxuser2 linuxfiles/linuxuser2ownernox/linuxuser2group
chmod 770 linuxfiles/linuxuser2ownernox/linuxuser2group

chown linuxuser2:linuxuser2 linuxfiles/linuxuser2ownernox/linuxuser2other
chmod 777 linuxfiles/linuxuser2ownernox/linuxuser2other

chown linuxuser2:linuxuser2 linuxfiles/linuxuser2ownernox/linuxuser2owner
chmod 700 linuxfiles/linuxuser2ownernox/linuxuser2owner
