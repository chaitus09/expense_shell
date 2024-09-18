source common.sh


# mysql password passing
mysql_root_password=$1
if [ -z "${mysql_root_password}" ]; then
  echo "input password is missing"
  exit 1
fi
dnf install mysql-server -y
systemctl enable mysqld
systemctl start mysqld

# setup mysql server password
#echo 'show databases'|mysql -h servername -uroot -pExpenseApp@1
#if [ $? -ne 0 ]; then
 # mysql_secure_installation --set-root-pass ${mysql_root_password}
  #fi

mysql_secure_installation --set-root-pass ${mysql_root_password}
#ExpenseApp@1
