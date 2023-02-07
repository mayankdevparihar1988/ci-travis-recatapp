#Build Phase
FROM node:16-alpine as builder
WORKDIR /app
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

#COPY DIST FROM builder phase to ngnix

FROM nginx as final
COPY --from=builder /app/build /usr/share/nginx/html
