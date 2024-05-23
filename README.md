# Infra 관련 공부용 Repository

## 공부 순서 계획
1. Local 환경에서 Nginx + Docker(compose)로 실습
2. Local 환경에서 k8s 방식으로 실습
3. k8s를 제공하는 Cloud 서비스 배포 환경에서 실습(NGINX+EC2(VM) -> EKS(GKE))

## Category
1. [practice1](./practice1-bluegreen-nginx-html): nginx로 Blue/Green 방식의 무중단 배포 - html만
2. [practice2](./practice2-bluegreen-nginx-api): nginx로 Blue/Green 방식의 무중단 배포 - API(Flask)