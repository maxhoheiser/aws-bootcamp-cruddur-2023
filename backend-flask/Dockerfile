# Use an official Python runtime as the base image
FROM python:3.12-slim as base

# Set the working directory in the container
WORKDIR /usr/src/app

# Copy the current directory contents into the container at /app
COPY ./requirements.txt ./requirements.txt

# Install any needed dependencies
RUN pip install --no-cache-dir -r requirements.txt


FROM base as dev
# Development image no gateway
# Install dev dependencies for debugging
RUN pip install debugpy
# Keeps Python from generating .pyc files in the container
ENV PYTHONDONTWRITEBYTECODE 1
# Turns off buffering for easier container logging
ENV PYTHONUNBUFFERED 1
# Set environment variables from .env file
ENV FLASK_ENV=development
ENV FRONTEND_URL="http://localhost:3000"
ENV BACKEND_URL="http://localhost:5000"
ENV PORT=5000
# Make flask port 5000 available to the world outside this container
EXPOSE ${PORT}

COPY . .

# Run app.py when the container launches
CMD ["python", "-m", "flask", "run", "--dev", "--host=0.0.0.0", "--port=5000"]


FROM base as prod
# Production image
RUN pip install gunicorn

COPY . .

ENV FLASK_ENV=production
ENV FRONTEND_URL="http://localhost:3000"
ENV BACKEND_URL="http://localhost:5000"
ENV PORT=5000
# Make gunicorn port 5000 available to the world outside this container
EXPOSE ${PORT}

CMD ["gunicorn", "--reload", "--bind", "0.0.0.0:${PORT}", "app:app"]
