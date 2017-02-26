. ./env || exit 1
for i in $gpu_dockers $cpu_dockers; do
    echo stopping twtf$i
    docker stop twtf$i
done

