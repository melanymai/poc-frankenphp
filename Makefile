# 🚀 Build the Docker containers
build:
	docker compose build --no-cache

# 🛳️ Start the Docker containers
up:
	docker compose up && docker compose logs

# 🛑 Stop the Docker containers
down:
	docker compose down --remove-orphans

# ⚙️ Make commands
.PHONY: create-database create-entity create-migration create-controller run-migration install enter fixtures

# 📦 Install dependencies
install:
	docker compose exec php composer install

# 📁 Create the database
create-database:
	docker compose exec php bin/console doctrine:database:create --if-not-exists

# 🧩 Create a new entity
create-entity:
	docker compose exec php bin/console make:entity

# 📄 Create a new migration
create-migration:
	docker compose exec php bin/console make:migration

# 🎮 Create a new controller
create-controller:
	docker compose exec php bin/console make:controller

# 🚀 Run database migration
run-migration:
	docker compose exec php bin/console doctrine:migrations:migrate -n

# 📟 Enter the PHP container
enter:
	docker compose exec php sh

# 📦 Run fixtures
fixtures:
	docker compose exec php bin/console doctrine:fixtures:load -n
