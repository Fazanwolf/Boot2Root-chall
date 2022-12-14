build:
	@cp -rf ../config .
	@docker build . -t chall1-img:v1
	@rm -rf config

run:
	@docker run --network=host --cap-add=NET_ADMIN --name chall1 -t -d chall1-img:v1 

rrun: rm
	@docker run --network=host --cap-add=NET_ADMIN --name chall1 -t -d chall1-img:v1 

exec:
	@docker exec -it chall1 /bin/bash

stop:
	@docker stop chall1

rm: stop
	@docker container rm chall1

clean: stop
	@docker image rm chall1-img:v1
	@docker container rm chall1

extract:
	@docker cp chall1:/app/data/ .