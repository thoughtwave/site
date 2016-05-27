#!/bin/bash
appname=$1
NEW=/tmp/${appname}.json
EXIST=${appname}.json
while [ true ]
do
curl -s http://www.meteorkitchen.com/api/getapp/json/qCbtcMThZtdwDbYhm > ${NEW}
diff ${NEW} ${EXIST}
if [ $? -gt 0 ]
then
 cp ${NEW} ${EXIST}
 date
 meteor-kitchen ${EXIST} ~/${appname}-site
fi
sleep 6
echo -n .

done
