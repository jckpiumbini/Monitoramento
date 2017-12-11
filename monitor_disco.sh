#!/bin/bash

LIMIT=$(echo 2*1024*1024 | bc)
SIZE=$(du -s / 2> /dev/null | awk {'print $1'})

CHAT_ID=""
TOKEN=""
URL="https://api.telegram.org/bot$TOKEN/sendMessage"

if [ $SIZE -ge $LIMIT ]; then
        MSG="Servidor InstaGuard-Azure. Limite de disco excedido. O DIR / esta com $SIZE"
        /usr/bin/curl -s -X POST $URL -d chat_id=$CHAT_ID -d text="$MSG" 2&> /dev/null
fi
