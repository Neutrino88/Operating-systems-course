#!/bin/bash

ERRORS="/home/user/errors.log"

sed -n '/^ACPI.*/p' /var/log/* >"$ERRORS" 2>/dev/null
sed -n '/\/.*\//p' "$ERRORS"