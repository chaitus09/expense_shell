print_Task_Heading()
{
  echo $1
  echo "#######$1########" &>> /tmp/expense.log
}

# mysql password passing
mysql_root_password=$1
if [ -z "${mysql_root_password}" ]; then
  echo "input password is missing"
  exit 1
fi