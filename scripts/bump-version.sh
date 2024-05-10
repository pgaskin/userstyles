#!/bin/bash
set -e

regexp='^(\s*@version\s*)(.+)\s*$'
for file in "$@"
do
    old="$(sed -n -E "s/${regexp}/\2/gp" "$file")"
    sed -i -E "s/${regexp}/\1$(date --utc +%Y%m%d.%H.%M)/g" "$file"
    new="$(sed -n -E "s/${regexp}/\2/gp" "${file}")"
    echo "${file}: ${old} -> ${new}"
done
