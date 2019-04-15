build-up:
	docker-compose up --build reverse-proxy

up:
	docker-compose up reverse-proxy

down:
	docker-compose down

frontend-dev:
	docker stop frontend && cd jumpstart-frontend && npm start && cd ..

frontend-build-up:
	docker-compose up --build -d frontend

comments-build-up:
	docker-compose up --build comments-service

projects-build-up:
	docker-compose up --build projects-service

build-push:
	docker-compose build projects-service comments-service frontend reverse-proxy
	docker push michaelkoconnor/jumpstart-projects-service &&\
	docker push michaelkoconnor/jumpstart-comments-service &&\
	docker push michaelkoconnor/jumpstart-frontend &&\
	docker push michaelkoconnor/jumpstart-reverse-proxy

# deploy:
# 	ssh -i ~/.ssh/firstInstance.pem ubuntu@ec2-18-234-245-254.compute-1.amazonaws.com "docker-compose pull && docker-compose up -d reverse-proxy"

deploy-frontend:
	ssh -i ~/.ssh/firstInstance.pem ubuntu@ec2-18-234-245-254.compute-1.amazonaws.com "docker-compose pull frontend && docker-compose up -d frontend"

deploy-backend:
	ssh -i ~/.ssh/firstInstance.pem ubuntu@ec2-18-234-245-254.compute-1.amazonaws.com "docker-compose pull comments-service projects service && docker-compose up -d comments-service projects-service"

# push-deploy:
# 	make build-push && make deploy