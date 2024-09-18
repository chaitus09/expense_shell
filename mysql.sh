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
mysql_secure_installation --set-root-pass ${mysql_root_password}
#ExpenseApp@1
