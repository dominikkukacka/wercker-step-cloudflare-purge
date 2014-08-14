#!/bin/bash

response=`curl -s https://www.cloudflare.com/api_json.html \
  -d "a=fpurge_ts" \
  -d "tkn=$WERCKER_CLOUDFLARE_PURGE_API" \
  -d "email=$WERCKER_CLOUDFLARE_PURGE_EMAIL" \
  -d "z=$WERCKER_CLOUDFLARE_PURGE_DOMAIN" \
  -d "v=1"`

result=`echo $response | sed 's/\\\\\//\//g' | sed 's/[{}]//g' | awk -v k="text" '{n=split($0,a,","); for (i=1; i<=n; i++) print a[i]}' | sed 's/\"\:\"/\|/g' | sed 's/[\,]/ /g' | sed 's/\"//g' | grep -w result`

if [ ${result##*|} == 'error' ]; then
  fail "An error occured while purging Cloudflare cache: $response"
else
  debug "Successfully purged the Cloudflare cache for domain $WERCKER_CLOUDFLARE_PURGE_DOMAIN"
fi
