#!/bin/bash

grep -oh "[[:alnum:]]\+@[.[:alnum:]]\+" /etc/* |
grep -oh "[[:alnum:]]\+@[.[:alnum:]]\+" |
tr -s '\n' ',' >emails.lst