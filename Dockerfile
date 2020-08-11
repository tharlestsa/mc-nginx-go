FROM nginx:mainline

COPY nginx.conf /etc/nginx/conf.d/default.conf.template

RUN mkdir -p /var/www/html
RUN touch /var/www/html/index.php
RUN chown www-data:www-data -R /var/www
COPY entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

RUN chown -R www-data. /var/www/* && chmod -R ugo+w /var/www/*
RUN FASTCGI_HOSTNAME="${MAPAS_HOSTNAME:-mapasculturais}"
RUN FASTCGI_PORT="${MAPAS_PORT:-9000}"
RUN sed "s/mapasculturais\:9000/$FASTCGI_HOSTNAME\:$FASTCGI_PORT/g" /etc/nginx/conf.d/default.conf.template > /etc/nginx/conf.d/default.conf
ENTRYPOINT ["/entrypoint.sh"]

#CMD ["nginx", "-g", "daemon off;"]