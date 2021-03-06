#!/bin/bash -ex

function check_mysql() {
  RETRY=12
  for i in $(eval echo "{1..$RETRY}"); do
    if echo PING | nc localhost 3306 | grep -q 'mysql'; then
      return 0
    else
      if [ $i -lt $RETRY ]; then
        sleep 10
      fi
    fi
  done

  return 1
}
