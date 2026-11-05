# 1. Outdated base image with known CVEs
FROM python:3.8-slim
WORKDIR /app
# 2. Hardcoded secret (Trivy secret scan detection)
ENV AWS_SECRET_KEY="AKIAIOSFODNN7ASDFGHJ"
# 3. Unnecessary network tools
RUN apt-get update && apt-get install -y curl wget net-tools
COPY vulnerable_app.py .
# 4. Runs as root by default (Misconfiguration detection)
EXPOSE 5000
CMD ["python", "vulnerable_app.py"]
