# /my-app/green/Dockerfile
FROM python:3.8-slim
WORKDIR /app
COPY app.py /app
RUN pip install flask
CMD ["python", "app.py"]