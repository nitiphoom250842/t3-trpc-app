# Use official Node.js LTS image
FROM node:20-alpine

# Set working directory
WORKDIR /app

# Copy package files and install dependencies
COPY package.json yarn.lock ./
RUN yarn install --frozen-lockfile

# Copy the rest of the app
COPY . .

# Build the app
RUN yarn build

# Expose port (default for T3 apps)
EXPOSE 5173

# Start the app in production
CMD ["yarn", "start"]
