#/bin/bash
changed_files="$(git diff-tree -r --name-only --no-commit-id ORIG_HEAD HEAD)"
echo $changed_files
check_run() {
  echo "$changed_files" | grep --quiet "$1" && eval "$2"
}

check_run composer.json "./composer install"
check_run database/migrations "sh -c \"php artisan migrate\""
check_run database/migrations "docker-compose run --rm web sh -c \"php artisan migrate\""
php artisan cache:clear
php artisan config:clear
php artisan route:clear
php artisan view:clear

#vendor/bin/phpunit --printer=Codedungeon\\PHPUnitPrettyResultPrinter\\Printer
