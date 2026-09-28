#!/bin/bash
# MD-6687 ONE-TIME node prerequisite for the sftp suite. Run as ROOT from the repo root:
#   bash framework/resources/Datasources/drill-1.22-delta/sftp/setup_sftp_user.sh
# Creates local user md6687sftp (password auth over sshd), a data dir with people.csvh, and stores the
# generated test password in sftp/.sftp_test_password (gitignored, readable by the ATS user only).
set -e
[ "$(id -u)" -eq 0 ] || { echo "run as root"; exit 1; }
DIR=$(cd "$(dirname "$0")" && pwd)
ATS_USER=${ATS_USER:-mapr}
U=md6687sftp
PWFILE="$DIR/.sftp_test_password"

id "$U" >/dev/null 2>&1 || useradd -m "$U"
if [ ! -s "$PWFILE" ]; then
  umask 077
  head -c 32 /dev/urandom | base64 | tr -dc 'A-Za-z0-9' | head -c 20 > "$PWFILE"
fi
echo "$U:$(cat "$PWFILE")" | chpasswd
chown "$ATS_USER" "$PWFILE"; chmod 600 "$PWFILE"

mkdir -p /home/$U/data
printf 'id,name\n1,alice\n2,bob\n3,carol\n' > /home/$U/data/people.csvh
chown -R $U:$U /home/$U/data
echo "sftp test user $U ready (password in $PWFILE)"
