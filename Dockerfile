FROM nginx:mainline

COPY nginx.conf /etc/nginx/conf.d/default.conf.template

RUN mkdir -p /var/www/html
RUN touch /var/www/html/index.php
RUN chown www-data:www-data -R /var/www

COPY entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

CMD ["nginx", "-g", "daemon off;"]