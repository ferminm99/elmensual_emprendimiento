#!/bin/sh

echo "🚀 Init start"

# 🌱 Inyectar variables como archivo .env real (porque Laravel las necesita así)
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

# 📦 Dependencias y cache limpio
composer install --no-scripts --no-autoloader
composer dump-autoload --optimize


php artisan config:clear
php artisan config:cache

php artisan tinker --execute="echo config('session.same_site');"


# 🛠️ Migraciones (evitamos crash si ya existen)
# php artisan migrate --force || true

php artisan serve --host=0.0.0.0 --port=8000
