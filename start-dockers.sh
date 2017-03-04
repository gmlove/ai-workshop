. ./env || exit 1

docker image pull $gpu_docker_image
docker image pull $cpu_docker_image

for i in $gpu_dockers; do
    nvidia-docker run -d -v /data/$host_name/workshop/data:/notebooks/data --name twtf$i -p 1000$i:8888 $gpu_docker_image
done

for i in $cpu_dockers; do
    docker run -d -v /data/$host_name/workshop/data:/notebooks/data -m 8000m --cpus 8 --name twtf$i -p 1000$i:8888 $cpu_docker_image
done

echo 'distribute the links below to users:'

sleep 5

for i in $gpu_dockers $cpu_dockers; do
    docker logs twtf$i 2>&1 | grep -v NotebookApp | grep \?token= | sed "s/localhost:8888/$ip:1000$i/" | tee -a links/links.txt
done


echo done
