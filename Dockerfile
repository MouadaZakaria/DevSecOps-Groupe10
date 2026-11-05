FROM python:3.11-alpine

WORKDIR /app

# 1. Hardening: Create non-root user and group
RUN addgroup -S appgroup && adduser -S appuser -G appgroup

# 2. Hardening: Remove unnecessary packaging tools (eliminates HIGH CVEs)
RUN pip uninstall -y setuptools wheel && \
    rm -rf /usr/local/lib/python3.11/site-packages/setuptools* \
           /usr/local/lib/python3.11/site-packages/wheel*

COPY vulnerable_app.py .

# 3. Hardening: Switch execution to non-privileged user
USER appuser

EXPOSE 5000
CMD ["python", "vulnerable_app.py"]
