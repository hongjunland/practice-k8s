# Practice5 - Kubernetes 
Kubernetes 실행을 위해 세팅 후 실행을 해보았습니다. Local에서 실습해보기 위해 `minikube`를 사용해 보았습니다.
## minikube 설치

[minikube start](https://minikube.sigs.k8s.io/docs/start/?arch=/windows/x86-64/stable/.exe+download)

- WSL: Linux(x84-64)
    - 설치
        ```shell
        curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
        sudo install minikube-linux-amd64 /usr/local/bin/minikube && rm minikube-linux-amd64
        ```
        

- minikube 실행
    - minikube 실행
        
        ```shell
        minikube start
        ```
    - 클러스터 정지
        ```shell
        minikube stop
        ```
    - 클러스터 삭제
        ```shell
        minikube delete
        ```
    - 접근
        
        ```shell
        minikube kubectl -- get po -A
        ```
        
    - 대시보드 실행
        
        ```shell
        minikube dashboard
        ```

- 간단한 Pod 실행(Nginx)

    - Nginx Pod 실행
        ```shell
        kubectl run nginx --image=nginx
        ```
    - Pod 상태 확인
        ```shell
        kubectl get pods
        ```

- 서비스 생성(네트워크 제공)
    - NodePort 서비스 생성
        ```shell
        kubectl expose pod nginx --type=NodePort --port=80
        ```
    
    - 서비스 확인
        ```shell
        kubectl get services
        ```

    - 서비스 테스트
        ```shell
        minikube service nginx
        ```
- 배포
    - deployment 생성
        ```shell
        kubectl apply -f nginx-deployment.yaml
        ```
    - 대시보드 실행
        ```shell
        minikube dashboard
        ```

- 실행 시 
    - port 22: SSH
    - port 2376: Docker Demon
    - port 32443(6443): Kubernetes API Server
    - port 5000: Registry
    - port 8443: Kubernetes API Server