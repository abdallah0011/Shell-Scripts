#!/bin/bash

# Usage ./<filename>

# keep date up-to-date
date=$(date '+%d-%m-%Y') 

function json_parser_python {
    # fetch data of today 
    var=$(curl "http://api.aladhan.com/v1/timingsByCity/${date}?city=Giza&country=Arab+Republic+Egypt" | jq .)
    export json_file=$var
    python3 -c "import os,json; fetch=os.environ['json_file'] ;
# print(fetch)
body=json.loads(fetch)['data']['timings']
date=json.loads(fetch)['data']['date']['gregorian']
# print (date)
print('\nDay: ',date['date'], '\n')
for row,col in body.items():
    print('\"%s\":  \t %s' %(row,col))
"
}


function json_parser_bash {
    var=$(curl "http://api.aladhan.com/v1/timingsByCity/${date}?city=Giza&country=Arab+Republic+Egypt" | json_pp -f json)
    # echo $var | jq .
    # printf "Day: `echo $var | jq '.data.date.gregorian.date'` \n"
    echo -n -e "\nDay: "; echo $var | jq '.data.date.gregorian.date'
    echo $var | jq '.data.timings'
}

# json_parser_bash
json_parser_python

