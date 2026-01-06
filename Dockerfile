# Use Node 20 LTS
FROM node:20-alpine

# Set working directory
WORKDIR /

# Copy package.json and pnpm lock
COPY package.json pnpm-lock.yaml ./

# Install pnpm
RUN npm install -g pnpm

# Install dependencies
RUN pnpm install --no-frozen-lockfile

# Copy all files
COPY . .

# Expose the port (Koyeb will override with PORT env)
EXPOSE 8080

# Start app
CMD ["node", "app.js"]
