#!/bin/sh
sudo dnf update -y
echo "Start Install Apache: "
sudo dnf install httpd -y
echo ""

echo "Start Install Python: "
sudo dnf install python3.12 -y
sudo ln -sf /usr/bin/python3.12 /usr/bin/python3
python3 --version

if [ -f "requirements.txt" ]; then
    echo "Installing requirements"
    python3 -m pip install -r requirements.txt
fi

echo ""
echo "Start Install PHP: "
sudo dnf install php php-cli php-common php-fpm php-mysqlnd -y
php -v
echo ""

echo "Start Web Server: "
sudo systemctl start httpd

sudo cp src/* /var/www/html
echo "Copied src files to /var/www/html"
