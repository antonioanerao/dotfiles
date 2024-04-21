#!/bin/bash

docker ps --format "{{.Names}}" | while read container; do
    ip=$(docker inspect --format '{{range .NetworkSettings.Networks}}({{.IPAddress}}){{end}}' "$container")
    stats=$(docker stats --no-stream --format "{{.MemUsage}} / \t{{ .CPUPerc }}" "$container")
    printf "%-40.40s\t%s\t%s\n" "$container $ip" "$stats" 
done
