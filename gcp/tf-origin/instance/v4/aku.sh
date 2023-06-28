#!/bin/bash

plan_output=$(terraform plan)

add_count=$(echo "$plan_output" | grep -oP 'Plan: (\d+) to add' | awk '{print $2}')
change_count=$(echo "$plan_output" | grep -oP '(\d+) to change' | awk '{print $1}')
destroy_count=$(echo "$plan_output" | grep -oP '(\d+) to destroy' | awk '{print $1}')

if [[ $add_count -gt 0 ]]; then
  echo "There is something add: $add_count"
fi

if [[ $change_count -gt 0 ]]; then
  echo "There is something change: $change_count"
fi

if [[ $destroy_count -gt 0 ]]; then
  echo "There is something delete: $destroy_count"
fi
