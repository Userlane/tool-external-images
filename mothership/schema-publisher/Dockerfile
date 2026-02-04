FROM uslnmaincr.azurecr.io/tool-kafka-schema-publisher:1.0.7

USER root
RUN apk upgrade --no-cache

USER www-data
COPY proto/ /app/schemas/proto/
