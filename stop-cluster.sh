#!/bin/bash

for pid in `ps -ax | grep cockroach | grep -v grep | awk '{print $1}'`; do
    kill -9 ${pid}
done
