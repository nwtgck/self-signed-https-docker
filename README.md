# self-signed-https
Docker image which enables your site with self-signed HTTPS easily

## Quick Start

Suppose http://localhost:8181/ is running. The following command runs a HTTPS server on port 8080.
```bash
docker run -p 8080:80 -p 4443:443  -it -e TARGET_HOST=localhost -e TARGET_PORT=3000 nwtgck/self-signed-https
```
