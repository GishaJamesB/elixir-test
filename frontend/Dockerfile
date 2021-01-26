FROM node:12-alpine

RUN apk add --update --no-cache bash 

COPY . /app/frontend

WORKDIR /app/frontend

CMD ["npm", "start"]