#!/usr/bin/env bash
FILE_PATH=$1
PV_WIDTH=$2
PV_HEIGHT=$3
X=$4
Y=$5

TEMPDIR=/tmp/

case "$(file --dereference --brief --mime-type -- "${FILE_PATH}")" in
  application/*zip|application/x-rar|application/x-7z-compressed)
    bsdtar --list --file "${FILE_PATH}" && return 5
    ;;
  audio/* | video/*)
    mediainfo "${FILE_PATH}" && return 5
    ;;
  application/pdf)
    pdftotext -l 10 -nopgbrk -q -- "${FILE_PATH}" - | \
      fmt -w "${PV_WIDTH}" && 
      return 5 || return 1
    ;;
  image/*)
    file "$FILE_PATH" && return 5
    ;;
  text/* | */xml | */*json) 
    env COLORTERM=8bit bat --color=always --style="plain" -- "${FILE_PATH}" && return 5
    ;;
esac
return 127 # nonzero retcode required for lf previews to reload
