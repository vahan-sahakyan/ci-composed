#!/usr/bin/env zsh

file_to_reapply=$1

declare -A COLORS=(
    [blue]="\033[34m"
    [green]="\033[32m"
    [red]="\033[31m"
    [yellow]="\033[33m"
    [reset]="\033[0m"
)
echo "${COLORS[yellow]}[+++] Re-Applying with keyword: ${file_to_reapply} ${COLORS[reset]}"

if [[ -z $file_to_reapply ]]; then
    echo "${COLORS[red]}[!] No filename specified. ${COLORS[reset]}"
    exit 1
fi

for dplt in ./k8s/*.yaml; do
    if [[ $dplt != *"$file_to_reapply"* ]]; then
        continue
    fi
    short_name=$(basename $dplt)
    echo "${COLORS[blue]}[+] Re-Applying: ${short_name%.yaml} ${COLORS[reset]}"
    kubectl delete -f ${dplt}
    kubectl apply -f ${dplt}
done

echo "${COLORS[yellow]}[+++] Re-Applying with keyword: ${file_to_reapply} ${COLORS[green]}🟢 DONE ${COLORS[reset]}"
