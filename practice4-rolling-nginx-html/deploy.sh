#!/bin/bash

# 현재 실행 중인 컨테이너 확인
active_container=$(docker ps --filter "name=app_" --format "{{.Names}}")

# 새로운 버전 결정
if [[ "$active_container" == *"app_v1"* ]]; then
  new_version="v2"
  old_version="v1"
else
  new_version="v1"
  old_version="v2"
fi

# 새로운 버전 빌드 및 실행
docker-compose build app_$new_version
docker-compose up -d app_$new_version

# 오래된 버전 중지
docker-compose stop app_$old_version

# 상태 확인
sleep 30
docker ps --filter "name=app_"

echo "Switched to app_$new_version"
