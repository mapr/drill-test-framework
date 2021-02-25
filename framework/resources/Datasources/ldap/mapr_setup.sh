
set -x

# setup mapr user if it does not exist
if id "mapr" &>/dev/null; then
  echo "mapr user found"
else
  echo "add mapr user"
  useradd -u 5000 mapr
fi

echo "mapr:mapr" | sudo chpasswd

