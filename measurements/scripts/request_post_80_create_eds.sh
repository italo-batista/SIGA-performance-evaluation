#!/bin/bash

id=7
for ((i=0; i<40; i+=1))
do
  id=$(echo "scale=2; $id + 1"|bc)
  echo $(date +%s%N)",POST,BEGIN,"$id >> request_post_80_create_eds.txt
  decimal=$(echo "scale=2; $i * 0.00007"|bc)
  longitude=$(echo "-35.907517+$decimal"|bc)
  curl -H "Content-Type: application/json" -X POST -d '{ "nome": "TESTE", "descricao": "xxxxxxxxxx", "atividade": "xxxxxxxxxx", "caracteristicasFisicas": { "localizacao": { "setor": "xxxx", "bloco": "xxxx" }, "area": 0, "n_pavimentos": 0, "ocupacaoMedia": 0, "n_baciasSanitarias": 0, "n_torneiras": 0, "n_duchas": 0, "n_chuveiros": 0, "n_pias": 0, "volumeReservatorio": 0 }, "mediaEsperada": 0, "geolocalizacao": {"latitude": -7.216000, "longitude": '$longitude'} }' localhost:3000/edificio
  echo $(date +%s%N)",POST,END,"$id >> request_post_80_create_eds.txt
  sleep 0.75s
done

for ((i=0; i<40; i+=1))
do
  id=$(echo "scale=2; $id + 1"|bc)
  echo $(date +%s%N)",POST,BEGIN,"$id >> request_post_80_create_eds.txt
  decimal=$(echo "scale=2; $i * 0.00007"|bc)
  latitude=$(echo "-7.21215-$decimal"|bc)
  curl -H "Content-Type: application/json" -X POST -d '{ "nome": "TESTE", "descricao": "xxxxxxxxxx", "atividade": "xxxxxxxxxx", "caracteristicasFisicas": { "localizacao": { "setor": "xxxx", "bloco": "xxxx" }, "area": 0, "n_pavimentos": 0, "ocupacaoMedia": 0, "n_baciasSanitarias": 0, "n_torneiras": 0, "n_duchas": 0, "n_chuveiros": 0, "n_pias": 0, "volumeReservatorio": 0 }, "mediaEsperada": 0, "geolocalizacao": {"latitude": '$latitude', "longitude": -35.907517} }' localhost:3000/edificio
  echo $(date +%s%N)",POST,END,"$id >> request_post_80_create_eds.txt
  sleep 0.75s
done

