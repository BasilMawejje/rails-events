make up: 
	docker-compose up -d

make down: 
	docker-compose down

make setup: 
	docker-compose down && docker-compose up -d