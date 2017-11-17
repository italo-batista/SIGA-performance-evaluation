#!/bin/bash

sudo apt install jq

curl http://localhost:3000/edificio/ | jq -r '.[]._id' >> "../data/eds_ids.txt"
