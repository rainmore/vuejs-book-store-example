FROM node:22.9.0-alpine AS build
WORKDIR /app
COPY package.json ./
RUN npm install
ENV PATH=/app/node_modules/.bin:$PATH
ARG VITE_APP_BACKEND_ADDRESS
ENV VITE_APP_BACKEND_ADDRESS=$VITE_APP_BACKEND_ADDRESS
COPY . .
RUN npm run build

FROM nginx:mainline-alpine-slim AS prod
COPY ./nginx.conf /etc/nginx/conf.d/default.conf
COPY --from=build /app/dist /var/www/html/
EXPOSE 3000
ENTRYPOINT ["nginx","-g","daemon off;"]