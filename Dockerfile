FROM php:8.2-cli

WORKDIR /app

# Instala dependências do sistema
RUN apt-get update && apt-get install -y unzip git curl zip

# Instala o Composer
RUN curl -sS https://getcomposer.org/installer | php \
    && mv composer.phar /usr/local/bin/composer

# Copia apenas os arquivos do Composer para aproveitar cache
COPY composer.json composer.lock ./

# Instala dependências do PHP
RUN composer install --no-interaction --prefer-dist

# Copia o restante da aplicação
COPY . .

# Define o comando de execução padrão
CMD ["php", "index.php"]
