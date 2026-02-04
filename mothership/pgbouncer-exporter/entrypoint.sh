#!/bin/sh
set -e

#Wait for pgbouncer
echo "Waiting for pgbouncer. Sleeping for $PRE_SLEEP seconds..."
sleep $PRE_SLEEP

#Pass all arguments to pgbouncer_exporter
/bin/pgbouncer_exporter $@
