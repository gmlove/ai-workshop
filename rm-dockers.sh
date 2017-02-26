. ./env || exit 1
for i in $gpu_dockers $cpu_dockers; do
    docker rm twtfgpu$i
done

