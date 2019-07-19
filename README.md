# server
Minimal sinatra server for creating branches

Please use docker to deploy!

  1. clone this repository
  2. create image with `docker build -t apu-server .`
  3. run the container with `docker run --rm --name apu-server -p 8080:8080 apu-server`
  4. browse to `http://whateverip or localhost:8080`
