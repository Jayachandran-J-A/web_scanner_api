# Dockerfile (crawler service)
FROM mcr.microsoft.com/playwright/python:v1.46.0-jammy

WORKDIR /app

# Install Python deps
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy code
COPY . .

# (Browsers are already preinstalled in this base image)
# If you ever need: RUN playwright install --with-deps

# FastAPI
EXPOSE 8001
CMD ["uvicorn", "crawler_api:app", "--host", "0.0.0.0", "--port", "8001"]
