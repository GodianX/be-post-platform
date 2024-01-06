FROM php:8.3-fpm

# Установка зависимостей Symfony
RUN apt-get update && apt-get install -y \
    git \
    unzip \
    libpq-dev \
    && rm -rf /var/lib/apt/lists/*

# Установка расширений PHP
RUN docker-php-ext-install pdo pdo_pgsql

WORKDIR /app

# Установка Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Копирование и установка зависимостей проекта
COPY composer.json composer.lock ./
RUN composer install --no-scripts --no-autoloader

# Копирование остальных файлов проекта
COPY . .

# Настройка прав доступа
RUN chown -R www-data:www-data var

# Генерация автозагрузки
RUN composer dump-autoload --optimize

CMD ["php-fpm"]
