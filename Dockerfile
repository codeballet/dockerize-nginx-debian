FROM ubuntu:20.04
RUN apt-get update && apt-get install -y vim
RUN apt-get install -y build-essential
RUN apt-get install -y wget && apt-get install -y tar
RUN apt-get install -y libpcre3 libpcre3-dev zlib1g zlib1g-dev libssl-dev
RUN wget http://nginx.org/download/nginx-1.23.1.tar.gz && tar -zxvf nginx-1.23.1.tar.gz
WORKDIR /nginx-1.23.1/
RUN ./configure \
    --sbin-path=/usr/bin/nginx \
    --conf-path=/etc/nginx/nginx.conf \
    --error-log-path=/var/log/nginx/error.log \
    --http-log-path=/var/log/nginx/access.log \
    --with-pcre \
    --pid-path=/var/run/nginx.pid \
    --with-http_ssl_module
RUN make && make install
WORKDIR /
CMD [ "nginx", "-g", "daemon off;" ]
