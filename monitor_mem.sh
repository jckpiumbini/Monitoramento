#!/bin/bash

LIMIT=$(echo 1*1024 | bc)
SIZE=$(free -m| grep Mem |tr -s " " " " | awk {'print $4'})

CHAT_ID=""
TOKEN=""
URL="https://api.telegram.org/bot$TOKEN/sendMessage"

if [ $SIZE -le $LIMIT ]; then
        MSG="Servidor Nome do Servidor. Limite de memoria excedido. Memoria disponivel $SIZE"
        /usr/bin/curl -s -X POST $URL -d chat_id=$CHAT_ID -d text="$MSG" 2&> /dev/null
        echo 3 > /proc/sys/vm/drop_cache
fi
