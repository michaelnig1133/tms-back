# Use official Python image
FROM python:3.12-slim

# Set environment to non-interactive
ENV DEBIAN_FRONTEND=noninteractive

# Set working directory
WORKDIR /code

# Install system dependencies required for mysqlclient
RUN apt-get update && apt-get install -y \
    default-libmysqlclient-dev \
    build-essential \
    gcc \
    && rm -rf /var/lib/apt/lists/*

# Install Python dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy project files
COPY . .
