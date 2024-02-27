#!/bin/bash

cores=$(grep -c '^processor' /proc/cpuinfo)
ram=$(awk '/MemTotal/ {print $2}' /proc/meminfo | awk '{printf "%.2f", $1/1024/1024}')
disk=$(df -h / | awk 'NR==2 {print $4}')

echo "CPU cores: "$cores > /usr/share/nginx/html/index.html
echo "RAM: "$ram >> /usr/share/nginx/html/index.html
echo "Disk: "$disk >> /usr/share/nginx/html/index.html

nginx -g 'daemon off;'
