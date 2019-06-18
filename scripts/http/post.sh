#!/bin/bash
set -x

protocol="https"
host="nightlyapi.betr.io"
path="api/subscriptions/anorlondo/invitations"

token=$1

body='[{"email":"belal.alktish@betr.io","language":"en-GB","subscriptionId":"anorlondo"}]'

auth_header="Authorization: Bearer $token"

curl -X POST "$protocol://$host/$path" --data "$body" -H "$auth_header" > response.json

prettier --write response.json
nvim response.json
rm response.json
