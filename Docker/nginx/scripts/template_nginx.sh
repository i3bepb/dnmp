#!/usr/bin/env bash
file_config_template=$1;
sed -e '/^$/d; /^#/d; s/\${/###/; s/\$/----/; s/###/\${/' ${file_config_template} | envsubst | sed 's/----/\$/'
