build:
	@cp -rf ../config .
	@docker build . -t chall2-img:v1
	@rm -rf config

run:
	@docker run --network=host --cap-add=NET_ADMIN --name chall2 -t -d chall2-img:v1 

rrun: rm
	@docker run --network=host --cap-add=NET_ADMIN --name chall2 -t -d chall2-img:v1 

exec:
	@docker exec -it chall2 /bin/bash

stop:
	@docker stop chall2

rm: stop
	@docker container rm chall2

clean: stop
	@docker image rm chall2-img:v1
	@docker container rm chall2

extract:
	@docker cp chall2:/app/data/ .