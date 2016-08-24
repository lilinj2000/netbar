#!/bin/sh

local_host="zj_37_18"
size_pkg="32 512 2048"
host_front="192.168.11.31 192.168.11.32"
for host in $host_front
do
  host_string=`echo $host | sed -e "s/\./_/g"`
  for size in $size_pkg
    do
      data_file="${local_host}_ping_${host_string}_size_${size}.log"
      #echo $data_file
      echo > $data_file
      ping -c 1000 -s $size $host  | tee $data_file
    done
done

