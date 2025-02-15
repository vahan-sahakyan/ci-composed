#!/usr/bin/env zsh

declare -A COLORS=(
    [blue]="\033[34m"
    [green]="\033[32m"
    [red]="\033[31m"
    [yellow]="\033[33m"
    [reset]="\033[0m"
)
echo "${COLORS[yellow]}[+++] Starting k8s ${COLORS[reset]}"

for dplt in ./k8s/*.yaml; do
    short_name=$(basename $dplt)
    echo "${COLORS[blue]}[+] Applying: ${short_name%.yaml} ${COLORS[reset]}"
    kubectl apply -f ${dplt}
done

echo "${COLORS[yellow]}[+++] Starting k8s: ${COLORS[green]}🟢 DONE ${COLORS[reset]}"