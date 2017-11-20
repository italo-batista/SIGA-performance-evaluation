#!/bin/bash

id=3001
filename="../../data/eds_ids.txt"
"ID,TIPO_REQUISICAO,MOMENTO,TIMESTAMP" >> "../../data/request_get_180_consumptions.csv"

while read -r line
do
    ed_id="$line"
    curl -X "DELETE" localhost:3000/edificio/"$ed_id"/
done < "$filename"
