FROM python:3.12-slim

WORKDIR /app

# Install uv
COPY --from=ghcr.io/astral-sh/uv:latest /uv /usr/local/bin/uv

# Copy dependency files
COPY pyproject.toml uv.lock ./

# Install dependencies into /opt/venv so the volume mount of /app doesn't shadow it
RUN UV_PROJECT_ENVIRONMENT=/opt/venv uv sync --frozen --no-dev --no-editable

# Copy source (overridden by volume mount in dev)
COPY app/ app/

ENV PATH="/opt/venv/bin:$PATH"
