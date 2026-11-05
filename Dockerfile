FROM python:3.11-alpine

WORKDIR /app

RUN addgroup -S appgroup && adduser -S appuser -G appgroup

COPY vulnerable_app.py .

USER appuser

EXPOSE 5000
CMD ["python", "vulnerable_app.py"]