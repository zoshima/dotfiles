#!/bin/bash
protocol="http"
host="localhost:60606"
path="betr/api/scim/users"

token="1627bb74-448d-4bcb-a8fc-08e307e8be1d"

auth_header="Authorization: Bearer $token"

curl -X GET "$protocol://$host/$path" -H "$auth_header" > response.json

prettier --write response.json
nvim response.json
rm response.json
