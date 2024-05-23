# Practice1 - Blue/Green 방식의 HTML 패키지
Blue/Green 방식으로 무중단 배포를 실습해 보았습니다. 가장 간단하고 기본적인 방법으로 로컬에서 Nginx + Docker를 통해서 배포했습니다.

## 실행 방법
* docker-compose.ymal 실행
    ```shell
    $ docker-compose up -d
    ```
* http://localhost:8888 로 접속

## 버전 업데이트 방법   
* green 버전 주석
    ```yaml
    # nginx.conf
    events {}

    http {
    upstream app {
        # server web-blue:80;
        server web-green:80; # Uncomment to switch to green
    }

    server {
        listen 80;

        location / {
        proxy_pass http://app;
        }
    }
    }
    ```
    
* reverse proxy 컨테이너를 reload

    ```shell
    $ docker-compose reverse-proxy reload
    ```

* http://localhost:8888 로 접속후 변경되었는지 확인