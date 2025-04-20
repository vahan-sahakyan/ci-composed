#!/usr/bin/env zsh

declare -A COLORS=(
    [blue]="\033[34m"
    [green]="\033[32m"
    [red]="\033[31m"
    [yellow]="\033[33m"
    [reset]="\033[0m"
)

ALL=(
    backend
    frontend
    ws-server
    zookeeper
    kafka
)

echo "${COLORS[yellow]}[+++] Restarting k8s ${COLORS[reset]}"
for dplt in "${ALL[@]}"; do
    echo -e "${COLORS[blue]}[+] Restarting: $dplt ${COLORS[reset]}"
    kubectl scale deployment $dplt --replicas=0
    kubectl scale deployment $dplt --replicas=1
done
echo "${COLORS[yellow]}[+++] Restarting k8s: ${COLORS[green]}🟢 DONE ${COLORS[reset]}"
