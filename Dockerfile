FROM python:3.11-slim-bookworm
RUN apt-get update && apt-get upgrade -y && apt-get install -y --only-upgrade libgnutls30 && apt-get clean
WORKDIR /app
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
COPY app.py .
EXPOSE 5000
CMD ["python", "app.py"]
