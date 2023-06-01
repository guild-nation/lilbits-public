#!/bin/bash

# usage:./inscribe [<from> <to>)
# eg. inscribe 100 120 -> 100, 101, 102... 119

COOKIE="/home/ubuntu/snap/bitcoin-core/common/.bitcoin/.cookie"
FEE=6

idx=0
for i in *.jpg; do
  echo "${idx}"
  ((idx++))
  if (( $idx < ${1} )); then
    continue
  elif (( $idx >= ${2} )); then
    break
  fi

  ord --cookie-file ${COOKIE} wallet inscribe --fee-rate ${FEE} "${i}" >> inscription.log;
done
