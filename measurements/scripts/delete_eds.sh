#!/bin/bash

id=3001
filename="../data/eds_ids.txt"

while read -r line
do
    ed_id="$line"
    curl -X "DELETE" localhost:3000/edificio/"$ed_id"/
done < "$filename"
