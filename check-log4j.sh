## Created by RubenZarco
Check_1="$(find / -name 'log4j*')"
Check_10="$(egrep -i -r '\$\{jndi:(ldap[s]?|rmi|dns):/[^\n]+' /var/log)"
Check_11="$(find /var/log -name \*.gz -print0 | xargs -0 zgrep -E -i '\$\{jndi:(ldap[s]?|rmi|dns):/[^\n]+')"

echo "---------------------------------";
echo -e "[Check 1]Check if log4j is installed\n"
if [ "$Check_1" ];
 then
  echo -e "[Warming] Log4j is installed you can check in the files:\n"
  echo "$Check_1"
  echo -e "\n"
###
  case $Check_1 in
   *"2.11"*)
    echo -e "Version 2.16, is OK"
   ;;
   *"2.15"*)
    echo -e "Version 2.15 is OK"
   ;;
   *)
    echo -e "Version <2.15, must update the newest log4j version"
   ;;
  esac
###
  echo "---------------------------------";
  echo -e "Check for exploitation attempts in uncompressed files in folder /var/log and all sub folders:\n"
  if [ "$Check_10" ];
   then
    echo -e "[Warming] Log4j uncompressed exploit files detected:\n"
    echo "$Check_10"
    else
    echo "[Check 10] Log4j uncompressed exploit files not detected"
  fi
  echo -e "\n---------------------------------\n";
  echo "---------------------------------";
  echo -e "Check for exploitation attempts in compressed files in folder /var/log and all sub folders\n"
  if [ "$Check_11" ];
   then
    echo -e "[Warming] Log4j compressed exploit files detected:\n"
    echo "$Check_11"
    else
    echo "[Check 11] Log4j compressed exploit files not detected"
  fi
  echo -e "\n---------------------------------\n";
  else
  echo "[Check 1] Log4j files not detected"
fi
echo -e "\n---------------------------------\n";
