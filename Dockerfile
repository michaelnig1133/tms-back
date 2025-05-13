# Use official Python image
FROM python:3.11

# Set environment to non-interactive
#ENV DEBIAN_FRONTEND=noninteractive

# Set environment variables
ENV PYTHONUNBUFFERED=1 \
    PIP_NO_CACHE_DIR=off \
    PIPENV_VENV_IN_PROJECT=1


# Set working directory
WORKDIR  /code


# Install system dependencies required for mysqlclient
RUN apt-get update && apt-get install -y \
    libpq-dev gcc curl && \
    rm -rf /var/lib/apt/lists/*

# Install Python dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
EXPOSE 8000
# Copy project files
COPY . .





