#! /bin/bash

cat X.log | grep "WARNING" | sed "s/WARNING/Warning/"

cat X.log | grep "INFO" | sed "s/INFO/Information/"

