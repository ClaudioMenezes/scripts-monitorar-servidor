#!/bin/bash

memoria_total=$(free | grep -i mem | awk '{ print $2 }')
echo $memoria_total
memoria_consumida=$(free | grep -i mem | awk '{ print $3 }')
echo $memoria_consumida
result=$(echo "scale=2;$memoria_consumida/$memoria_total*100" | bc | awk -F. '{print $1}' )
echo $result

if [ $result -gt 10 ]
then
echo 'perigo de estouro de memoria!! Usados:' $result'%.'
fi

