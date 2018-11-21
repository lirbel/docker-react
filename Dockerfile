FROM node:alpine AS builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build


FROM nginx
# copy the build folder from the last phase to folder in the nginx container
COPY --from=builder /app/build /usr/share/nginx/html
# the default command in this image is to start nginx
