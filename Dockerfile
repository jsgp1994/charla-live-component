FROM php:8.4-fpm

# Extensiones necesarias
RUN apt-get update && apt-get install -y \
    git zip unzip libpq-dev libicu-dev gnupg curl \
    && docker-php-ext-install pdo pdo_pgsql intl \
    && rm -rf /var/lib/apt/lists/*

# Composer
COPY --from=composer:2 /usr/bin/composer /usr/bin/composer

# Node + npm + yarn
RUN curl -fsSL https://deb.nodesource.com/setup_20.x | bash - \
    && apt-get install -y nodejs \
    && npm install -g yarn

WORKDIR /var/www/html

# Ajustar UID/GID y PERMISOS sobre /var/www
RUN usermod -u 1000 www-data && groupmod -g 1000 www-data \
    && chown -R www-data:www-data /var/www

# (opcional, pero recomendable)
ENV HOME=/var/www

USER www-data

CMD ["php-fpm"]
