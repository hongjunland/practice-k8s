#!/bin/bash

# 설정 파일 경로
COMPOSE_FILE=docker-compose.yaml

# Docker Compose 설정 파일 백업
cp $COMPOSE_FILE ${COMPOSE_FILE}.bak

# app1을 v2로 업데이트
echo "Updating app1 to v2..."
sed -i 's/image: '\''app:v1'\''/image: '\''app:v2'\''/' $COMPOSE_FILE

# app1을 재배포
docker-compose up -d --no-deps app1
sleep 10  # 잠시 대기하여 업데이트가 완료될 시간을 줍니다

# app2를 v2로 업데이트
echo "Updating app2 to v2..."
sed -i '0,/image: '\''app:v1'\''/{s/image: '\''app:v1'\''/image: '\''app:v2'\''/}' $COMPOSE_FILE

# app2를 재배포
docker-compose up -d --no-deps app2
sleep 10  # 잠시 대기하여 업데이트가 완료될 시간을 줍니다

echo "Rolling update completed."

# 설정 파일 원래대로 복원
mv ${COMPOSE_FILE}.bak $COMPOSE_FILE
