FROM python:3.12-slim

RUN pip install flask

WORKDIR /app
COPY app.py /app/app.py

EXPOSE 8080
CMD ["python3", "app.py"]
