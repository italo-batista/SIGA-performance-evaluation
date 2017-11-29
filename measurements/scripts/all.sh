#!/bin/bash

echo "Iniciando"
./create_eds.sh
echo "Predios Criados"
source ./get_eds_ids.sh
echo "GET DONE"
cd requests
source ./request_post_80_create_water_consumption.sh
echo "CREATE 80 DONE"
source "./request_post_180_create_water_consumption.sh"
echo "CREATE 180 DONE"
source "./request_get_180_consumptions.sh"
echo "GET 180 DONE"
source "./request_get_80_consumptions.sh"
echo "GET 80 DONE"

mv "../../data/request_get_180_consumptions.csv" "../../data/1GB/I4/"
mv "../../data/request_get_80_consumptions.csv" "../../data/1GB/I4/"
mv "../../data/request_post_80_create_water_consumption.csv" "../../data/1GB/I4/"
mv "../../data/request_post_180_create_water_consumption.csv" "../../data/1GB/I4/"
cd -
sh "./delete_eds.sh"
rm -f "../data/eds_ids.txt"

