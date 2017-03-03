. ./env || exit 1

test $host_name != "ai03" && exit 0

for i in $gpu2_dockers; do
    echo stopping twtf$i
    docker stop twtf$i
done

