# Etapa base
FROM php:8.2-fpm-alpine

# Instalar dependencias
RUN apk --no-cache add \
    git curl zip unzip mysql-client \
    nodejs npm \
    && docker-php-ext-install pdo pdo_mysql

# Instalar Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Directorio de trabajo
WORKDIR /var/www/html

# Copiar composer para instalar dependencias sin ejecutar scripts
COPY composer.json composer.lock ./
RUN composer install --no-scripts --no-autoloader

# Copiar todo el código
COPY . .

# Generar autoload optimizado sin scripts
RUN composer dump-autoload --optimize --no-scripts

# Copiar init.sh y darle permisos
COPY init.sh /init.sh
RUN chmod +x /init.sh

# 🏷️ Link a tu repo de GitHub
LABEL org.opencontainers.image.source=https://github.com/ferminm99/elmensual_emprendimiento

# Comando de inicio
CMD ["sh", "/init.sh"]
