#!/bin/bash
# Update system packages and install Nginx
yum update -y
amazon-linux-extras enable nginx1 || true
yum install -y nginx

# Write the custom API routing block configuration
cat << 'CONFIG' > /etc/nginx/conf.d/api.conf
server {
    listen 80;
    server_name _;

    root /usr/share/nginx/html;
    index index.html index.htm;

    location / {
        try_files $uri $uri/ =404;
    }

    location /api/ {
        default_type application/json;
        return 200 '{"status":"success","message":"Welcome to the Phoenix API backend route!"}\n';
    }
}
CONFIG

# Restart Nginx to load the new blueprint configuration
systemctl restart nginx
systemctl enable nginx
