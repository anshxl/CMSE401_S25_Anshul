#!/bin/bash

runs=10
total=0

for i in $(seq 1 $runs); do
    echo "Run #$i"
    runtime=$( /usr/bin/time -f "%e" make test_serial 2>&1 | tail -n 1)
    echo "Runtime: $runtime seconds"
    total=$(echo "$total + $runtime" | bc)
done

average=$(echo "$total / $runs" | bc -l)
echo "Average Runtime: $average" 
