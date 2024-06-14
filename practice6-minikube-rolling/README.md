## minikube 설치

- Docker 환경을 minikube로 변경(안하면 인증에러 발생)
    
    ```bash
    eval $(minikube docker-env)
    ```
    
- Application 적용
    
    ```bash
    kubectl apply -f [deployment 파일 이름].yaml
    ```
    
- Service 적용
    
    ```bash
    kubectl apply -f [service 파일 이름].yaml
    ```
    
- Minikube에서 배포한 서비스(Local 환경)는 외부 port가 닫혀있어서 tunnel로 뚫어 줘야합
    
    ```bash
    minikube tunnel
    ```
    
- Rolling Update
    
    ```bash
    kubectl set image deployment/[metadata 이름] [app 이름]=[이미지 이름]:[태그(버전)]
    output -> deployment.apps/fastapi-deployment image updated
    ```
    
- Rolling Update 상태 확인
    
    ```bash
    kubectl rollout status deployment/[metadata 이름]
    output -> deployment "fastapi-deployment" successfully rolled out
    ```
    
- 롤백
    
    ```bash
    kubectl rollout undo deployment/[metadata 이름]
    ```