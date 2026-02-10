#!/bin/bash

# load population data and do stuff with it 
temp_file=$(mktemp)

# download data 
curl -s -k -o $temp_file https://raw.githubusercontent.com/resbaz/r-novice-gapminder-files/master/data/gapminder-FiveYearData.csv 

# filter
# cut -d , -f 1 $temp_file | tail -n +2 | tr -d "\"" | sort | uniq

# # prompt for country 
# echo "Enter a country"
# read country 
country=$1

# print data for this country
# head -n 1 $temp_file
# grep -i "$country" $temp_file 

# for prev pop
prev_pop=$((0))
for entry in $(grep "$country" $temp_file | cut -d, -f 2,3)
do 
    IFS=", "
    read year pop <<< "$entry" 

    # handle first year (pop is same as prev pop)
    if [ "$prev_pop" -eq 0 ]
    then 
        prev_pop=$pop
    fi 

    growth=$(($pop - $prev_pop))

    echo $year, $pop, $growth 

    pprev_pop=$pop
done


#d delete 
rm $temp_file