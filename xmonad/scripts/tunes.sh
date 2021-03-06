#!/bin/bash

if pidof cmus >/dev/null; then
  artist=$(cmus-remote -Q |grep 'tag artist' |cut -d' ' -f3- |cut -c-31)
  title=$(cmus-remote -Q |grep title |cut -d' ' -f3- |cut -c-31)
  out=$artist::$title
  if [[ $(cmus-remote -Q | grep status| cut -d' ' -f2) == 'paused' ]]; then
    out=:$(echo $out| cut -c-80):
  fi
else
  out=''
fi

echo $out

