# Testing NGINX on Docker

## For the SSL configuration

Create self-signed ssl key and cert:

```
openssl req -x509 -days 10 -nodes -newkey rsa:4096 -keyout /etc/nginx/ssl/self.key -out /etc/nginx/ssl/self.crt
```

Create Diffie-Hellman params:
For more information about DH, see those articles from [Wikipedia](https://en.wikipedia.org/wiki/Diffie%E2%80%93Hellman_key_exchange) and [Hackernoon](https://hackernoon.com/algorithms-explained-diffie-hellman-1034210d5100).

```
openssl dhparam -out /etc/nginx/ssl/dhparam.pem 4096
```

SSL cipher suits for the Nginx `ssl_ciphers` configuration are sourced from [https://www.ssl.com/guide/tls-standards-compliance/](https://www.ssl.com/guide/tls-standards-compliance/).

## Rate limiting

The tool used for testing rate limiting is [Siege](https://www.joedog.org/siege-home/).
For instance, a test may be executed as:

```
siege -v -r 2 -c 5 https://localhost/screenshot.jpg
```

Here are some articles about rate limiting for Nginx:

- [https://www.nginx.com/blog/rate-limiting-nginx/](https://www.nginx.com/blog/rate-limiting-nginx/)
- [https://www.freecodecamp.org/news/nginx-rate-limiting-in-a-nutshell-128fe9e0126c](https://www.freecodecamp.org/news/nginx-rate-limiting-in-a-nutshell-128fe9e0126c)
