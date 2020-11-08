# Pav Laravel Training

## Environment
- [Laravel 8.X ](https://laravel.com/docs/8.x)
- PHP 7.2.*
- MySQL 5.7

## IDE
- [Visual Studio Code](https://azure.microsoft.com/ja-jp/products/visual-studio-code/)
### Setup
- Install extensions
    - [Laravel 5 Snippets](https://marketplace.visualstudio.com/items?itemName=onecentlin.laravel5-snippets)
    - [Laravel Blade Snippets](https://marketplace.visualstudio.com/items?itemName=onecentlin.laravel-blade)
    - [php cs fixer](https://marketplace.visualstudio.com/items?itemName=junstyle.php-cs-fixer)
    - [PHP Intelephense](https://marketplace.visualstudio.com/items?itemName=bmewburn.vscode-intelephense-client)
- Setup
    - For Laravel Blade Snippets
        - edit settings.json
            ```
            "blade.format.enable": true
            ```
    - For php cs fixer
        - download from [php-cs-fixer.phar](https://cs.symfony.com/download/php-cs-fixer-v2.phar) and store it on your computer. (e.g. ~/.vscode/bin/php-cs-fixer.phar)
        - edit settings.json
            ```
            "php-cs-fixer.executablePath": "~/.vscode/bin/php-cs-fixer.phar",
            "php-cs-fixer.autoFixBySemicolon": true
            ```
        - Then you can format using shortcut (alt+shift+f)!
    - For PHP Intelephense
        - generate _ide_helper  
        `php artisan ide-helper:generate`
    - For others
        - edit settings.json
            ```
            "php.suggest.basic": false,
            "php.validate.enable": false,
            "files.eol": "\n",
            "files.associations": {
                "*.blade.php": "html"
            }
            ```

## Libraries
### Development
- [Laravel Debugbar](https://github.com/barryvdh/laravel-debugbar)
- [PHP-CS-Fixer](https://github.com/FriendsOfPHP/PHP-CS-Fixer)
- [GrumPHP](https://github.com/phpro/grumphp)
- [PHPMD](https://github.com/phpmd/phpmd)
- [PHPCPD](https://github.com/sebastianbergmann/phpcpd)

## Setup
### On Docker
1. git clone git@github.com:pav-thanhtt/pav-laravel.git
1. cd pav-laravel
1. export APP_DEBUG=true
1. docker-compose build
1. docker-compose up
1. docker-compose run --rm web sh -c "export APP_DEBUG=true; .docker/setup.sh"
1. open URL [http://localhost:10080](http://localhost:10080)

## Tips
### Cache clear
composer c
### Laravel Mix
- Install modules  
`npm install && npm run dev`
- monitoring  
`npm run watch-poll`
### Routes
- e.g. Route::resource('user', 'UserController')

  |Method|URI|Action|Route name|
  |---|---|---|---|
  |GET|/user|index|user.index|
  |GET|/user/create|create|user.create|
  |POST|/user|store|user.store|
  |GET|/user/{user}|show|user.show|
  |GET|/user/{user}/edit|edit|user.edit|
  |PUT/PATCH|/user/{user}|update|user.update|
  |DELETE|/user/{user}|destroy|user.destroy|
### Comparisons of $x with PHP functions
|Expression|if ($x)|isset()|empty()|is_null()|
|---|---|---|---|---|
|$x = ''|false|__true__|__true__|false|
|$x = null|false|false|__true__|__true__|
|var $x|false|false|__true__|__true__|
|$x is undefined|false|false|__true__|__true__|
|$x = array()|false|__true__|__true__|false|
|$x = array('a', 'b')|__true__|__true__|false|false|
|$x = true|__true__|__true__|false|false|
|$x = false|false|__true__|__true__|false|
|$x = 1|__true__|__true__|false|false|
|$x = 0|false|__true__|__true__|false|
|$x = -1|__true__|__true__|false|false|
|$x = '1'|__true__|__true__|false|false|
|$x = '0'|false|__true__|__true__|false|
|$x = '-1'|__true__|__true__|false|false|
|$x = 'php'|__true__|__true__|false|false|
|$x = 'true'|__true__|__true__|false|false|
|$x = 'false'|__true__|__true__|false|false|
### Tests
- Copy .env.testing-docker or .env.testing-homestead to .env.tesing (It's up to your environment)
- Do `php artisan config:cache --env=testing` and `phpunit`
- After testing then do `composer cc`. It's cached .env file.
### Log
- If you want to check executed sql
  - code
    ```
    \DB::enableQueryLog();
    $data = Item::all();

    // display to browser
    dd(\DB::getQueryLog());
    // display to log file
    \Log::debug(\DB::getQueryLog());
    ```
## Training Level
### Basic
- [How Does Laravel Framework Work?](https://learn2torials.com/a/how-laravel-works)
- [Building Your First Laravel Application](https://laravel-news.com/your-first-laravel-application)
- [Laravel Routing](https://learn2torials.com/a/laravel-routing)
- [Laravel Controllers](https://learn2torials.com/a/laravel-controllers)
- [Laravel Views](https://learn2torials.com/a/laravel-views)
- [Eloquent: API Resources](https://learn2torials.com/a/eloquent-resources)
- [Laravel Middlewares](https://learn2torials.com/a/laravel-middleware)
- [Laravel Sessions](https://learn2torials.com/a/laravel-sessions)
- [Laravel User Authentication](https://learn2torials.com/a/laravel-authentication-based-on-roles)
- [Laravel Validation](https://learn2torials.com/a/laravel-form-validation)
- [Laravel Background Queue Job](https://learn2torials.com/a/how-to-create-background-job-in-laravel)
- [Laravel Supervisor](https://learn2torials.com/a/how-to-setup-laravel-supervisor)
- [Laravel Weekly Mysql Backups](https://learn2torials.com/a/laravel-weekly-mysql-backup)
- [Laravel Redirect To Https](https://learn2torials.com/a/laravel-redirect-all-requests-to-https)
- [Laravel Localization](https://learn2torials.com/a/laravel-localization)
- [Laravel Time Zones Handling](https://learn2torials.com/a/how-to-handle-time-zones-using-laravel)
- [Laravel Caching](https://learn2torials.com/a/laravel-caching)
- [Creating Your Own PHP Helpers in a Laravel Project](https://laravel-news.com/creating-helpers)
- [Optimize Laravel Eloquent Queries with Eager Loading](https://laravel-news.com/eloquent-eager-loading)
### Advance
- [Laravel Socket IO Integration](https://learn2torials.com/a/setup-socket-io-with-laravel)
- [Laravel Braintree Integration](https://learn2torials.com/a/integrate-braintree-using-laravel)
- [Laravel Stripe Integration](https://learn2torials.com/a/integrate-stripe-with-laravel)
- [Laravel OpenTok Integration](https://learn2torials.com/a/how-to-setup-opentok-api-with-laravel)
- [Laravel Uplod Images To S3](https://learn2torials.com/a/laravel-uplod-images-to-s3-bucket)
- [Laravel Passport](https://learn2torials.com/a/how-to-install-laravel-passport)
- [Laravel Create Packages](https://learn2torials.com/a/how-to-create-laravel-package)
- Building A Vue SPA With Laravel
  - [Part 1](https://laravel-news.com/using-vue-router-laravel)
  - [Part 2](https://laravel-news.com/building-vue-spa-laravel-part-2)
  - [Part 3](https://laravel-news.com/building-vue-spa-laravel-part-3)
  - [Part 4](https://laravel-news.com/building-vue-spa-laravel-part-4)
  - [Part 5](https://laravel-news.com/building-a-vue-spa-with-laravel-part-5)
  - [Part 6](https://laravel-news.com/building-a-vue-spa-with-laravel-part-6)
- [Real-time messaging with Nexmo and Laravel](https://laravel-news.com/real-time-messaging-nexmo-laravel)

## License
The Laravel framework is open-sourced software licensed under the [MIT license](https://opensource.org/licenses/MIT).
