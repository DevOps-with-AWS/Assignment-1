FROM nginx:latest
RUN adduser --home /home/docker docker 
USER docker:docker
ENV APP_HOME /usr/share/nginx/html
COPY --chown=docker:docker maintenance-page/*.* /usr/share/nginx/html/
USER root
RUN chown -R docker:docker /usr/share/nginx/ && chown -R docker:docker /var/run/ && chown -R docker:docker /run && chown -R docker:docker /etc/nginx && chown -R docker:docker /tmp
USER docker 
EXPOSE 8080
WORKDIR /usr/share/nginx/html
CMD ["nginx", "-g", "daemon off;"]
