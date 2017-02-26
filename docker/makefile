all: cpu gpu

cpu:
	docker build -f Dockerfile-cpu . -t ai02:5000/twtf:1.0.0
	docker image push ai02:5000/twtf:1.0.0

gpu:
	docker build -f Dockerfile-gpu . -t ai02:5000/twtf:1.0.0-gpu
	docker image push ai02:5000/twtf:1.0.0-gpu

