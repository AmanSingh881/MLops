# 1. Upgrade from buster to bookworm (supported Debian release)
FROM python:3.8-slim-bookworm

WORKDIR /app

COPY . /app

# 2. Combined apt commands into a single layer to avoid repository errors and minimize image size
RUN apt-get update && apt-get install -y \
    awscli \
    ffmpeg \
    libsm6 \
    libxext6 \
    unzip \
    && rm -rf /var/lib/apt/lists/*

# 3. Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt
