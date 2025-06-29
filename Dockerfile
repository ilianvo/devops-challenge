FROM python:3.9-slim

WORKDIR /app

COPY notification.py .

RUN pip install requests

# Environment variables for customization
ENV IMAGE_VERSION=latest
ENV CUSTOM_VARIABLE=devops-challenge

CMD ["python", "notification.py"]
