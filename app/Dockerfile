# ========================
# Install dependencies only
# ========================
FROM node:22-alpine AS deps
RUN apk add --no-cache libc6-compat
WORKDIR /app
COPY package.json pnpm-lock.yaml ./
RUN npm install -g pnpm
RUN pnpm install --frozen-lockfile

# ========================
# Build the source code
# ========================
FROM node:22-alpine AS builder
WORKDIR /app
COPY --from=deps /app/node_modules ./node_modules
COPY . .

ARG DATABASE_TYPE
ARG BASE_PATH
ENV DATABASE_TYPE=$DATABASE_TYPE
ENV BASE_PATH=$BASE_PATH
ENV NEXT_TELEMETRY_DISABLED=1
# Provide temporary DB for prisma generate
ENV DATABASE_URL="file:./dev.db"

# Copy prisma schema to ensure it exists
COPY prisma ./prisma

# Generate Prisma client
RUN npx prisma generate

# Build the Next.js app
RUN npm run build-docker

# ========================
# Production image
# ========================
FROM node:22-alpine AS runner
WORKDIR /app

ARG NODE_OPTIONS
ENV NODE_ENV=production
ENV NEXT_TELEMETRY_DISABLED=1
ENV NODE_OPTIONS=$NODE_OPTIONS

RUN addgroup --system --gid 1001 nodejs
RUN adduser --system --uid 1001 nextjs

# Install pnpm
RUN npm install -g pnpm

# Add curl
RUN apk add --no-cache curl

# Script dependencies for runtime
RUN pnpm add npm-run-all dotenv prisma@6.7.0

# Fix permissions for prisma runtime
RUN chown -R nextjs:nodejs node_modules/.pnpm/

# Copy files from builder
COPY --from=builder --chown=nextjs:nodejs /app/node_modules ./node_modules
COPY --from=builder --chown=nextjs:nodejs /app/public ./public
COPY --from=builder --chown=nextjs:nodejs /app/prisma ./prisma
COPY --from=builder --chown=nextjs:nodejs /app/scripts ./scripts
COPY --from=builder --chown=nextjs:nodejs /app/.next/static ./.next/static

# Conditionally copy standalone if exists
RUN if [ -d /app/.next/standalone ]; then \
      cp -r /app/.next/standalone ./; \
    else \
      echo ".next/standalone not found, skipping"; \
    fi

# Custom routes
RUN if [ -f ./.next/routes-manifest.json ]; then \
      mv ./.next/routes-manifest.json ./.next/routes-manifest-orig.json; \
    fi

USER nextjs
EXPOSE 3000
ENV HOSTNAME=0.0.0.0
ENV PORT=3000

CMD ["pnpm", "start-docker"]