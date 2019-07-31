#!/usr/bin/env bash
file_config_template=$1;
sed -e '/^$/d; /^#/d; s/\${/###/g; s/\$/----/g; s/###/\${/g' ${file_config_template} | envsubst | sed 's/----/\$/g'
