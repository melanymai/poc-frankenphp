#!/usr/bin/env sh


setfacl -R -m u:www-data:rwX -m u:"$(whoami)":rwX var
setfacl -dR -m u:www-data:rwX -m u:"$(whoami)":rwX var

if [ "$1" = 'frankenphp' ]; then

  composer install

  if [ "$APP_ENV" = 'prod' ]; then
        composer dump-autoload --optimize
  fi;

  if [ "$APP_ENV" = 'prod' ]; then
     php bin/console cache:clear \
       && php bin/console cache:warmup
  fi;


  php bin/console doctrine:database:create -n --if-not-exists
  php bin/console doctrine:migrations:migrate -n --allow-no-migration
  if [ "$APP_ENV" = 'dev' ]; then
    php bin/console doctrine:fixtures:load -n
  fi
  php bin/console assets:install
  php bin/console cache:warmup
fi

exec docker-php-entrypoint "$@"
