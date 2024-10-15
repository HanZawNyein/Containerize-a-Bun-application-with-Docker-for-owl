# Use the official Bun image
FROM oven/bun:1 AS base
WORKDIR /usr/src/app

# Install dependencies
COPY package.json bun.lockb ./
RUN bun install --frozen-lockfile

# Copy all project files
COPY . .

# Run tests (optional)
RUN bun test

# Build the app (production)
RUN bun run build

# Expose the app port
USER bun
EXPOSE 3000/tcp

# Start the app
CMD ["bun", "run", "start"]
