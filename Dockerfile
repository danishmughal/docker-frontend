# 1. Build Phase
FROM node:alpine AS builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# 2. Run Phase
FROM nginx:alpine
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html