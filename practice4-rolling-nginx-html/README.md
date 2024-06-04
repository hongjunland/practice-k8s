# Practice4 - Rolling Update 방식의 API 패키지 
Rolling Update 방식으로 무중단 배포를 실습해 보았습니다. 로컬환경에서 가장 간단하고 기본적인 방법으로 Nginx + Docker Compose를 통해 배포해 보았습니다.

## 실행 방법
* v1, v2 이미지 빌드
    ```shell
    ## v1
    $ docker build -t app:v1
    ```
    ```shell
    ## v2
    $ docker build -t app:v2
    ```

* docker-compose.yaml 실행
    ```shell
    $ docker-compose up -d
    ```

## 버전 업데이트 방법
* rolling_update.sh 실행
    ```shell
    $ source rolling_update.sh
    ```