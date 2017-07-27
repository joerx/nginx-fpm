# Generic Nginx as FastCGI Proxy

- Serves existing files statically
- Forwards everything else to a specified FPM
- FPM should be running as linked container

## Usage

- Provide name of linked container, port for FPM as env vars on startup
- Uses `envsubst` to substitute placeholders in default nginx config file
- Use shared volume (or bind-mounts) to share static files

- E.g. in `docker-compose.yml`:

```yml
version: '3'

services:
  web:
    image: joerx/nginx-fpm
    links:
      - app
    environment:
      FPM_HOST: 'app'
      FPM_PORT: '9000'
    volumes:
      - pub-files:/var/www/html/public
  # app hs fpm listening on port 9000
  app:
    build: .
    volumes:
      - pub-files:/var/www/html/public

volumes:
  pub-files:
```
