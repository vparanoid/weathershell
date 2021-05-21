#!/bin/bash

# example wttr
#{
#    "current_condition": [
#        {
#            "humidity": "37",
#            "temp_C": "27",
#        }
#    ],
if [ $# -eq 0 ]; then
    echo "Usage: $0 <CityName>"
    exit 1
fi

JWETHER=`curl -s wttr.in/$1?format=j1`

HUMIDITY=`echo "${JWETHER}" | jq '."current_condition"[] | ."humidity"'`
TEMPERATURE=`echo "${JWETHER}" | jq '."current_condition"[] | ."temp_C"'`

# strip quotes
HUMIDITY=$(eval echo $HUMIDITY)
TEMPERATURE=$(eval echo $TEMPERATURE)

echo "City: $1 Temp: ${TEMPERATURE} Humidity: ${HUMIDITY}"
