FROM node:7-onbuild

HEALTHCHECK --interval=5s \
            --timeout=5s \
            CMD curl -f http://52.229.220.160:8080 || exit 1

EXPOSE 8080