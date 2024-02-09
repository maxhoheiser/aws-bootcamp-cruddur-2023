# Use an official Python runtime as the base image
FROM python:3.12-slim

# Set the working directory in the container
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Install any needed dependencies
RUN pip install --no-cache-dir -r requirements.txt


# Set environment variables from .env file
ENV FLASK_ENV=development
ENV FRONTEND_URL="http://localhost:3000"
ENV BACKEND_URL="http://localhost:4567"
ENV PORT=4567

# Make flask port 4567 available to the world outside this container
EXPOSE ${PORT}

# Run app.py when the container launches
CMD ["python", "-m", "flask", "run", "--host=0.0.0.0", "--port=4567"]