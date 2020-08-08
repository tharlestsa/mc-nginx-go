# Imagem Docker do NGINX para uso com o MapasCulturais

O container do mapasculturais deve se chamar `mapasculturais` e estar acessíve na porta `9000`

```
    location ~ \.php$ {
        fastcgi_split_path_info ^(.+\.php)(/.+)$;
        fastcgi_pass mapasculturais:9000;
        fastcgi_index index.php;
        include fastcgi_params;
        fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
        fastcgi_param PATH_INFO $fastcgi_path_info;
    }
```