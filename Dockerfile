FROM nikolaik/python-nodejs:latest

RUN apt-get update && \
  apt-get install -y \
  webp \
  ffmpeg \
  imagemagick && \
  rm -rf /var/lib/apt/lists/*

COPY package.json .
RUN npm install nodemon@latest
RUN mkdir /MdSanzy
WORKDIR /MdSanzy
COPY . /MdSanzy
ENV TZ=Asia/Jakarta
RUN pwd
RUN ls

EXPOSE 5000

CMD ["npm", "start"]