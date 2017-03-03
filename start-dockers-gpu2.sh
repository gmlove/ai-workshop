. ./env || exit 1

docker image pull $gpu_docker_image

test $host_name != "ai03" && exit 0

for i in $gpu2_dockers; do
    nvidia-docker run -d -e "CUDA_VISIBLE_DEVICES=1" -v /data/$host_name/workshop/data:/notebooks/data --name twtf$i -p 100$i:8888 $gpu_docker_image
done

echo 'distribute the links below to users:'

sleep 5

for i in $gpu2_dockers; do
    docker logs twtf$i 2>&1 | grep -v NotebookApp | grep \?token= | sed "s/localhost:8888/$ip:100$i/" | tee -a links/links.txt
done


echo done

