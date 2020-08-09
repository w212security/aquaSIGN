# bring back the date trick!
# hax0rs all currently installed applications to allow "infinite" signing

echo "[*] checking..."

if [ $(id -u) != 0 ]
then
  echo "[!] this script must be run as root."
  exit 0
fi

if [ "$(sw_vers -productName)" != "iPhone OS" ]
then
  echo "[!] this script must be run on an iOS device."
  exit 0
fi

echo "[*] hax0ring..."
chown -R root /var/MobileDevice/

if [ $? != 0 ]
then
  echo "[!] error with chown. "
  exit $?
fi

chgrp -R wheel /var/MobileDevice/

if [ $? != 0 ]
then
  echo "[!] error with chgrp. "
  exit $?
fi

echo "[*] success!"
echo "[*] all installed applications should be \"infinitely\" signed. simply set the date back to when they were signed once they expire to use them again."
