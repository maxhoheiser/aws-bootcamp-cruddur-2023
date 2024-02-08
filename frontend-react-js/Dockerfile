# Use an official Node.js image as the base image
FROM node:18-alpine

# Set the working directory in the container
WORKDIR /usr/src/app

# Copy package.json and package-lock.json files
COPY package*.json ./

# Install dependencies
RUN npm install --loglevel verbose

# Copy the rest of the application's source code
COPY . .

# Build your React app (if needed)
RUN npm run build

# Set environment variables from .env file
ENV BACKEND_URL="http://127.0.0.1:4567"
ENV PORT=3001

# Make flask port 3001 available to the world outside this container
EXPOSE ${PORT}

# Specify the command to run your React app
CMD ["npm", "start"]