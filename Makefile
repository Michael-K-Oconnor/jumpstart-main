build-up:
	docker-compose up --build reverse-proxy

up:
	docker-compose up reverse-proxy

down:
	docker-compose down

backend-up:
	docker-compose up -d projects-service && docker-compose up -d comments-service

proxy-up:
	docker-compose up reverse-proxy

frontend-build-up:
	docker-compose up --build -d frontend

comments-build-up:
	docker-compose up --build comments-service

projects-build-up:
	docker-compose up --build projects-service

build:
	docker-compose build projects-service comments-service frontend reverse-proxy

build-push:
	docker build -t michaelkoconnor/jumpstart-projects-service ./projects-service &&\
	docker build -t michaelkoconnor/jumpstart-comments-service ./comments-service &&\
	docker build -t michaelkoconnor/jumpstart-frontend ./frontend &&\
	docker build -t michaelkoconnor/jumpstart-reverse-proxy ./reverse-proxy &&\
	docker push michaelkoconnor/jumpstart-projects-service &&\
	docker push michaelkoconnor/jumpstart-comments-service &&\
	docker push michaelkoconnor/jumpstart-frontend &&\
	docker push michaelkoconnor/jumpstart-reverse-proxy