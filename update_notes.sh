#! /bin/bash

# Read envars
MYMANAGER=$(grep MYMANAGER_NAME .env | awk -F '=' '{print $2}')
ME=$(grep MY_NAME .env | awk -F '=' '{print $2}')

# Construct file
filename="1-on-1-records/$(date '+%Y-%m-%d').md"

if [ -z "$(ls -A 1-on-1-records)" ]; then
   mkdir `1-on-1-records`
fi

# Prepare template 
cat expectations.md > ${filename}
cat >> ${filename} << EOF

# Agenda: Week Of $(date '+%B %d, %Y')
EOF
cat template.md >> ${filename}

sed -i "s/MYMANAGER/${MYMANAGER}/g" ${filename}
sed -i "s/ME/${ME}/g" ${filename}