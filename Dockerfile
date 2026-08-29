FROM python:3.10-slim

LABEL org.opencontainers.image.title="Richchar CLI"
LABEL org.opencontainers.image.description="CLI pipeline for photorealistic talking-character video generation"
LABEL org.opencontainers.image.source="https://github.com/iamrichmack111/richchar-cli"
LABEL org.opencontainers.image.version="1.1.0"

RUN apt-get update && apt-get install -y --no-install-recommends \
    bash \
    ffmpeg \
    git \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY . /app

RUN chmod +x /app/richchar /app/scripts/doctor.sh

ENTRYPOINT ["/app/richchar"]
CMD ["--help"]
