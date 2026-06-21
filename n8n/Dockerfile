FROM docker.n8n.io/n8nio/n8n:2.27.3

USER root

RUN mkdir -p /home/node/.n8n/nodes \
    && cd /home/node/.n8n/nodes \
    && npm init -y \
    ### Add needed community nodes
    && npm install n8n-nodes-personio-hr \
    && chown -R node:node /home/node/.n8n

USER node
