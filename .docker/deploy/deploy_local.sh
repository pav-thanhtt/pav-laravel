#/bin/bash
changed_files="$(git diff-tree -r --name-only --no-commit-id ORIG_HEAD HEAD)"
echo $changed_files
check_run() {
  echo "$changed_files" | grep --quiet "$1" && eval "$2"
}

check_run composer.json "docker-compose run --rm web sh -c \"composer install\""
check_run database/migrations "docker-compose run --rm web sh -c \"php artisan migrate\""

docker-compose run --rm web sh -c "php artisan cache:clear"
docker-compose run --rm web sh -c "php artisan config:clear"
docker-compose run --rm web sh -c "php artisan route:clear"
docker-compose run --rm web sh -c "php artisan view:clear"
