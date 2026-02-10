#!/bin/bash

# Fahrenheit to Celsius converter
# Usage: ./f_to_c.sh 98.6

F=$1

C=$(echo "scale=2; ($F - 32) * 5 / 9" | bc)

echo "$F°F = $C°C"
