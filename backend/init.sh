#!/bin/sh

echo "🚀 Init start"

# Crear .env desde variables
echo "APP_ENV=$APP_ENV" > .env
echo "APP_DEBUG=$APP_DEBUG" >> .env
echo "APP_KEY=$APP_KEY" >> .env
echo "APP_URL=$APP_URL" >> .env
echo "DB_CONNECTION=$DB_CONNECTION" >> .env
echo "DB_HOST=$DB_HOST" >> .env
echo "DB_PORT=$DB_PORT" >> .env
echo "DB_DATABASE=$DB_DATABASE" >> .env
echo "DB_USERNAME=$DB_USERNAME" >> .env
echo "DB_PASSWORD=$DB_PASSWORD" >> .env
echo "SESSION_DRIVER=$SESSION_DRIVER" >> .env
echo "SESSION_DOMAIN=$SESSION_DOMAIN" >> .env
echo "SESSION_SECURE_COOKIE=$SESSION_SECURE_COOKIE" >> .env
echo "SESSION_SAME_SITE=$SESSION_SAME_SITE" >> .env
echo "SESSION_HTTP_ONLY=$SESSION_HTTP_ONLY" >> .env
echo "SANCTUM_STATEFUL_DOMAINS=$SANCTUM_STATEFUL_DOMAINS" >> .env

echo "✅ .env copiado:"
cat .env

# ⚠️ Sobrescribir la config de sesión directamente
echo "<?php return ['same_site' => 'none'];" > config/session.php

# Reinstalar sin scripts ni cache anticipada
composer install --no-scripts --no-autoloader
composer dump-autoload --optimize

# Limpiar config
php artisan config:clear
php artisan config:cache

# Verificar que se tomó correctamente
php artisan tinker --execute="echo '🧪 same_site: ' . config('session.same_site');"

php artisan serve --host=0.0.0.0 --port=8000
