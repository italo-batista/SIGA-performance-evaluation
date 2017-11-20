#!/bin/bash

id=8001
filename="../../data/eds_ids.txt"
echo "ID,TIPO_REQUISICAO,MOMENTO,TIMESTAMP" >> "../../data/request_get_80_reports_pdf.csv"

while read -r line
do
    ed_id="$line"
    
    for i in {1..15}
	do
	  
	  id=$(echo "scale=2; $id + 1"|bc)
	  
	  echo $id",POST,BEGIN,"$(date +%s%N) >> "../../data/request_get_80_reports_pdf.csv"
	  curl -g localhost:3000/relatorio/edificio/"$ed_id"/pdf
	  echo $id",POST,END,"$(date +%s%N) >> "../../data/request_get_80_reports_pdf.csv"
	  
	  sleep 0.75s
	done    
done < "$filename"
