hadoop fs -copyFromLocal -p /tmp/ldapfiles/ldapuser1owner/ldapuser1group /tmp/ldapfiles/ldapuser1owner/ldapuser1group1cp
hadoop fs -copyFromLocal -p /tmp/ldapfiles/ldapuser1owner/ldapuser1other /tmp/ldapfiles/ldapuser1owner/ldapuser1other1cp
hadoop fs -copyFromLocal -p /tmp/ldapfiles/ldapuser1owner/ldapuser1owner /tmp/ldapfiles/ldapuser1owner/ldapuser1owner1cp
hadoop fs -copyFromLocal -p /tmp/ldapfiles/ldapuser1owner/ldapuser2group /tmp/ldapfiles/ldapuser1owner/ldapuser2group1cp
hadoop fs -copyFromLocal -p /tmp/ldapfiles/ldapuser1owner/ldapuser2other /tmp/ldapfiles/ldapuser1owner/ldapuser2other1cp
hadoop fs -copyFromLocal -p /tmp/ldapfiles/ldapuser1owner/ldapuser2owner /tmp/ldapfiles/ldapuser1owner/ldapuser2owner1cp
echo
hadoop fs -copyFromLocal -p /tmp/ldapfiles/ldapuser1group/ldapuser1group /tmp/ldapfiles/ldapuser1group/ldapuser1group1cp
hadoop fs -copyFromLocal -p /tmp/ldapfiles/ldapuser1group/ldapuser1other /tmp/ldapfiles/ldapuser1group/ldapuser1other1cp
hadoop fs -copyFromLocal -p /tmp/ldapfiles/ldapuser1group/ldapuser1owner /tmp/ldapfiles/ldapuser1group/ldapuser1owner1cp
hadoop fs -copyFromLocal -p /tmp/ldapfiles/ldapuser1group/ldapuser2group /tmp/ldapfiles/ldapuser1group/ldapuser2group1cp
hadoop fs -copyFromLocal -p /tmp/ldapfiles/ldapuser1group/ldapuser2other /tmp/ldapfiles/ldapuser1group/ldapuser2other1cp
hadoop fs -copyFromLocal -p /tmp/ldapfiles/ldapuser1group/ldapuser2owner /tmp/ldapfiles/ldapuser1group/ldapuser2owner1cp
echo
hadoop fs -copyFromLocal -p /tmp/ldapfiles/ldapuser1other/ldapuser1group /tmp/ldapfiles/ldapuser1other/ldapuser1group1cp
hadoop fs -copyFromLocal -p /tmp/ldapfiles/ldapuser1other/ldapuser1other /tmp/ldapfiles/ldapuser1other/ldapuser1other1cp
hadoop fs -copyFromLocal -p /tmp/ldapfiles/ldapuser1other/ldapuser1owner /tmp/ldapfiles/ldapuser1other/ldapuser1owner1cp
hadoop fs -copyFromLocal -p /tmp/ldapfiles/ldapuser1other/ldapuser2group /tmp/ldapfiles/ldapuser1other/ldapuser2group1cp
hadoop fs -copyFromLocal -p /tmp/ldapfiles/ldapuser1other/ldapuser2other /tmp/ldapfiles/ldapuser1other/ldapuser2other1cp
hadoop fs -copyFromLocal -p /tmp/ldapfiles/ldapuser1other/ldapuser2owner /tmp/ldapfiles/ldapuser1other/ldapuser2owner1cp
echo
hadoop fs -copyFromLocal -p /tmp/ldapfiles/ldapuser2owner/ldapuser1group /tmp/ldapfiles/ldapuser2owner/ldapuser1group1cp
hadoop fs -copyFromLocal -p /tmp/ldapfiles/ldapuser2owner/ldapuser1other /tmp/ldapfiles/ldapuser2owner/ldapuser1other1cp
hadoop fs -copyFromLocal -p /tmp/ldapfiles/ldapuser2owner/ldapuser1owner /tmp/ldapfiles/ldapuser2owner/ldapuser1owner1cp
hadoop fs -copyFromLocal -p /tmp/ldapfiles/ldapuser2owner/ldapuser2group /tmp/ldapfiles/ldapuser2owner/ldapuser2group1cp
hadoop fs -copyFromLocal -p /tmp/ldapfiles/ldapuser2owner/ldapuser2other /tmp/ldapfiles/ldapuser2owner/ldapuser2other1cp
hadoop fs -copyFromLocal -p /tmp/ldapfiles/ldapuser2owner/ldapuser2owner /tmp/ldapfiles/ldapuser2owner/ldapuser2owner1cp
echo
hadoop fs -copyFromLocal -p /tmp/ldapfiles/ldapuser2group/ldapuser1group /tmp/ldapfiles/ldapuser2group/ldapuser1group1cp
hadoop fs -copyFromLocal -p /tmp/ldapfiles/ldapuser2group/ldapuser1other /tmp/ldapfiles/ldapuser2group/ldapuser1other1cp
hadoop fs -copyFromLocal -p /tmp/ldapfiles/ldapuser2group/ldapuser1owner /tmp/ldapfiles/ldapuser2group/ldapuser1owner1cp
hadoop fs -copyFromLocal -p /tmp/ldapfiles/ldapuser2group/ldapuser2group /tmp/ldapfiles/ldapuser2group/ldapuser2group1cp
hadoop fs -copyFromLocal -p /tmp/ldapfiles/ldapuser2group/ldapuser2other /tmp/ldapfiles/ldapuser2group/ldapuser2other1cp
hadoop fs -copyFromLocal -p /tmp/ldapfiles/ldapuser2group/ldapuser2owner /tmp/ldapfiles/ldapuser2group/ldapuser2owner1cp
echo
hadoop fs -copyFromLocal -p /tmp/ldapfiles/ldapuser2other/ldapuser1group /tmp/ldapfiles/ldapuser2other/ldapuser1group1cp
hadoop fs -copyFromLocal -p /tmp/ldapfiles/ldapuser2other/ldapuser1other /tmp/ldapfiles/ldapuser2other/ldapuser1other1cp
hadoop fs -copyFromLocal -p /tmp/ldapfiles/ldapuser2other/ldapuser1owner /tmp/ldapfiles/ldapuser2other/ldapuser1owner1cp
hadoop fs -copyFromLocal -p /tmp/ldapfiles/ldapuser2other/ldapuser2group /tmp/ldapfiles/ldapuser2other/ldapuser2group1cp
hadoop fs -copyFromLocal -p /tmp/ldapfiles/ldapuser2other/ldapuser2other /tmp/ldapfiles/ldapuser2other/ldapuser2other1cp
hadoop fs -copyFromLocal -p /tmp/ldapfiles/ldapuser2other/ldapuser2owner /tmp/ldapfiles/ldapuser2other/ldapuser2owner1cp

hadoop fs -rm /tmp/ldapfiles/ldapuser1owner/ldapuser1group1cp
hadoop fs -rm /tmp/ldapfiles/ldapuser1owner/ldapuser1other1cp
hadoop fs -rm /tmp/ldapfiles/ldapuser1owner/ldapuser1owner1cp
hadoop fs -rm /tmp/ldapfiles/ldapuser1owner/ldapuser2group1cp
hadoop fs -rm /tmp/ldapfiles/ldapuser1owner/ldapuser2other1cp
hadoop fs -rm /tmp/ldapfiles/ldapuser1owner/ldapuser2owner1cp
hadoop fs -rm /tmp/ldapfiles/ldapuser1group/ldapuser1group1cp
hadoop fs -rm /tmp/ldapfiles/ldapuser1group/ldapuser1other1cp
hadoop fs -rm /tmp/ldapfiles/ldapuser1group/ldapuser1owner1cp
hadoop fs -rm /tmp/ldapfiles/ldapuser1group/ldapuser2group1cp
hadoop fs -rm /tmp/ldapfiles/ldapuser1group/ldapuser2other1cp
hadoop fs -rm /tmp/ldapfiles/ldapuser1group/ldapuser2owner1cp
hadoop fs -rm /tmp/ldapfiles/ldapuser1other/ldapuser1group1cp
hadoop fs -rm /tmp/ldapfiles/ldapuser1other/ldapuser1other1cp
hadoop fs -rm /tmp/ldapfiles/ldapuser1other/ldapuser1owner1cp
hadoop fs -rm /tmp/ldapfiles/ldapuser1other/ldapuser2group1cp
hadoop fs -rm /tmp/ldapfiles/ldapuser1other/ldapuser2other1cp
hadoop fs -rm /tmp/ldapfiles/ldapuser1other/ldapuser2owner1cp
hadoop fs -rm /tmp/ldapfiles/ldapuser2owner/ldapuser1group1cp
hadoop fs -rm /tmp/ldapfiles/ldapuser2owner/ldapuser1other1cp
hadoop fs -rm /tmp/ldapfiles/ldapuser2owner/ldapuser1owner1cp
hadoop fs -rm /tmp/ldapfiles/ldapuser2owner/ldapuser2group1cp
hadoop fs -rm /tmp/ldapfiles/ldapuser2owner/ldapuser2other1cp
hadoop fs -rm /tmp/ldapfiles/ldapuser2owner/ldapuser2owner1cp
hadoop fs -rm /tmp/ldapfiles/ldapuser2group/ldapuser1group1cp
hadoop fs -rm /tmp/ldapfiles/ldapuser2group/ldapuser1other1cp
hadoop fs -rm /tmp/ldapfiles/ldapuser2group/ldapuser1owner1cp
hadoop fs -rm /tmp/ldapfiles/ldapuser2group/ldapuser2group1cp
hadoop fs -rm /tmp/ldapfiles/ldapuser2group/ldapuser2other1cp
hadoop fs -rm /tmp/ldapfiles/ldapuser2group/ldapuser2owner1cp
hadoop fs -rm /tmp/ldapfiles/ldapuser2other/ldapuser1group1cp
hadoop fs -rm /tmp/ldapfiles/ldapuser2other/ldapuser1other1cp
hadoop fs -rm /tmp/ldapfiles/ldapuser2other/ldapuser1owner1cp
hadoop fs -rm /tmp/ldapfiles/ldapuser2other/ldapuser2group1cp
hadoop fs -rm /tmp/ldapfiles/ldapuser2other/ldapuser2other1cp
hadoop fs -rm /tmp/ldapfiles/ldapuser2other/ldapuser2owner1cp
