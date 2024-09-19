mysql_root_password=$1
if [ -z "${mysql_root_password}" ]; then
  echo "input password is missing"
  exit 1
fi

dnf module disable nodejs -y
dnf module enable nodejs:20 -y
dnf install nodejs -y

id expense
if [ $? -ne 0 ]; then
useradd expense
else
  echo "user is already there"
  exit 2
fi

cp backend.service  /etc/systemd/system/backend.service
rm -rf /app
mkdir /app
curl -o /tmp/backend.zip https://expense-artifacts.s3.amazonaws.com/expense-backend-v2.zip
cd /app
unzip /tmp/backend.zip
cd /app
npm install


systemctl daemon-reload
systemctl enable backend
systemctl start backend
dnf install mysql -y
mysql -h 172.31.24.124 -uroot -p${mysql_root_password} < /app/schema/backend.sql
#ExpenseApp@1mysql_root_password