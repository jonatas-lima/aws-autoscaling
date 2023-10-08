#!/bin/bash

load_balancer_address=$1

for i in `seq 1000`; do curl "$load_balancer_address?n=$2"; done
