#!/bin/sh
cd /var/www/

# composerの実行
export COMPOSER_ALLOW_SUPERUSER=1

if [ "$APP_DEBUG" = "true" -o "$APP_DEBUG" = "True" ]
then
  # dev 環境用 開発ツール有り
  composer --no-interaction install --ignore-platform-reqs
else
  # prd stg 環境用 開発ツール無し
  composer --no-interaction install --no-dev --ignore-platform-reqs
fi

cp .env-local-docker .env

# マイグレーション＆seederの実行
# php artisan migrate

# キャッシュクリア
php artisan cache:clear
php artisan config:clear
php artisan route:clear
php artisan view:clear

#npm install
#npm run prod

chown -R www:www /var/www

