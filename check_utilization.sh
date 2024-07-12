#!/bin/bash

THRESHOLD=2.0
CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print 100 - $1}')

if (( $(echo "$CPU_USAGE > $THRESHOLD" | bc -l) )); then
    SUBJECT="High CPU Usage Alert"
    EMAIL="prabir.kalwani@gmail.com"
    CONTENT="CPU usage is above $THRESHOLD% on $(hostname)"
    echo "$CONTENT" | mail -s "$SUBJECT" "$EMAIL"
fi

