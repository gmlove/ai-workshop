. ./env || exit 1
for i in $gpu_dockers $cpu_dockers; do
    echo stopping twtfgpu$i
    docker stop twtfgpu$i
done

