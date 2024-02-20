#!/bin/sh

directory="$(dirname $(realpath $0))"
touch "${directory}/logs/EVB-500-000-001-broker.log"
touch "${directory}/logs/EVB-500-000-002-broker.log"
touch "${directory}/logs/EVB-500-000-003-broker.log"
touch "${directory}/logs/EVB-500-000-004-broker.log"
touch "${directory}/logs/cloud-bridge-broker.log"
touch "${directory}/logs/EVB-04-telegraf.log"
