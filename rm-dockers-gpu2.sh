. ./env || exit 1

test $host_name != "ai03" && exit 0

for i in $gpu2_dockers; do
    docker rm twtf$i
done

