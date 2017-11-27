#!/bin/bash

id=6001
filename="../../data/eds_ids.txt"
echo "ID,TIPO_REQUISICAO,MOMENTO,TIMESTAMP" >> "../../data/request_get_180_consumptions.csv"

while read -r line
do
    ed_id="$line"
    
    for i in {1..7}
	do
	  
	  id=$(echo "scale=2; $id + 1"|bc)
	  
	  echo $id",GET,BEGIN,"$(date +%s%N) >> "../../data/request_get_180_consumptions.csv"
	  curl -g localhost:3000/edificio/"$ed_id"/consumo
	  echo $id",GET,END,"$(date +%s%N) >> "../../data/request_get_180_consumptions.csv"
	  
	  sleep 0.333s
	done    
done < "$filename"
