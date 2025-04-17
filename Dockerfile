# Use an official Node.js runtime as the base image
FROM node:latest

# Set the working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json to install dependencies first
COPY package*.json ./

# Install dependencies (if package.json exists)
# RUN npm install || echo "No package.json found, skipping npm install"

# Copy the rest of the application files
COPY . .

# Expose port 8000
EXPOSE 8000

# Command to start the application
CMD ["node", "script.js"]
