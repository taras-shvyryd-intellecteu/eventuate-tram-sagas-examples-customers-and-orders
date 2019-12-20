#! /bin/bash -e

docker run $* \
   --name mysqlterm --rm \
   mysql:5.7.13 \
   sh -c 'exec mysql  -uroot -prootpassword -o eventuate'
