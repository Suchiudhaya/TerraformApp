# Build frontend
FROM node:18-alpine as builder
WORKDIR /app/frontend
COPY frontend/package*.json ./
COPY frontend/ ./
RUN npm ci && npm run build


# Nginx image with built static files + proxy configuration
FROM nginx:stable-alpine
COPY --from=builder /app/frontend/build /usr/share/nginx/html
COPY nginx/nginx.conf /etc/nginx/conf.d/default.conf
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
