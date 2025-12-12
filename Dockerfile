# Simple Dockerfile that installs a stable n8n version from npm
FROM node:18-bullseye-slim

ENV N8N_VERSION=0.304.0

# Install dependencies and n8n globally
RUN apt-get update && apt-get install -y --no-install-recommends \
    make gcc g++ python3 ca-certificates \
 && npm i -g n8n@${N8N_VERSION} \
 && apt-get remove -y make gcc g++ python3 \
 && apt-get autoremove -y \
 && rm -rf /var/lib/apt/lists/* /root/.npm

ENV N8N_PORT=5678
EXPOSE 5678

CMD ["n8n", "start"]
