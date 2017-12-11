#!/bin/bash

LIMIT=$(echo 1*1024 | bc)
SIZE=$(free -m| grep Mem |tr -s " " " " | awk {'print $4'})

CHAT_ID="117542501"
TOKEN="494248488:AAFg6gpSt1pc7i5_aQz6G0Oe_vvaxNicCcw"
URL="https://api.telegram.org/bot$TOKEN/sendMessage"

if [ $SIZE -le $LIMIT ]; then
        MSG="Servidor InstaGuard-Azure. Limite de memoria excedido. Memoria disponivel $SIZE"
        /usr/bin/curl -s -X POST $URL -d chat_id=$CHAT_ID -d text="$MSG" 2&> /dev/null
        echo 3 > /proc/sys/vm/drop_cache
fi
