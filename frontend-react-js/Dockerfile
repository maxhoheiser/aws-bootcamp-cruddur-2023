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
ENV REACT_APP_BACKEND_URL="http://localhost:4567"
ENV PORT=3000

# Make flask port 3000 available to the world outside this container
EXPOSE ${PORT}

# Specify the command to run your React app
CMD ["npm", "start"]