#!/bin/bash

id=4001
filename="../../data/eds_ids.txt"
"ID,TIPO_REQUISICAO,MOMENTO,TIMESTAMP" >> "../../data/request_post_80_create_water_consumption.csv"

while read -r line
do
    ed_id="$line"
    
    for i in {1..15}
	do
	  
	  id=$(echo "scale=2; $id + 1"|bc)
	  data="2017-11-$i 12:00:00"
	  consumo=$(( ( RANDOM % 10 )  + 1 ))
	  
	  echo $id",POST,BEGIN,"$(date +%s%N) >> "../../data/request_post_80_create_water_consumption.csv"
	  curl -g -H "Content-Type:application/json" -X POST -d '{ "data":"'"$data"'","consumo":"'"$consumo"'" }' localhost:3000/edificio/"$ed_id"/consumo/new	  
	  echo $id",POST,END,"$(date +%s%N) >> "../../data/request_post_80_create_water_consumption.csv"
	  	  
	  sleep 0.75s
	done    
done < "$filename"

h="2017-11-21 "$(date | awk '{print $4}')
