#!/bin/bash

# 현재 active app 확인
current_app=$(grep -oP 'proxy_pass http://\K(blue|green)' nginx.conf)

# 새로운 app 결정
if [ "$current_app" == "blue" ]; then
  new_app="green"
else
  new_app="blue"
fi

# Nginx 설정 업데이트
sed -i "s|proxy_pass http://$current_app;|proxy_pass http://$new_app;|" nginx.conf

# Nginx 설정 리로드
docker exec $(docker ps -q --filter "name=nginx") nginx -s reload

echo "Switched to $new_app"