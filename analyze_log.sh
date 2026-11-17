#!/usr/bin/env bash

LOG_FILE="${1:-transit_session.log}"

if [ ! -f "$LOG_FILE" ]; then
    echo "Error: Log file '$LOG_FILE' not found." >&2
    exit 1
fi

sessions=$(grep -c "===== New session started" "$LOG_FILE")
zebra_stops=$(grep -c "Zebra crossing! Stopping" "$LOG_FILE")
lane_changes=$(grep -c "Changing lane:" "$LOG_FILE")

latest_driver=$(grep "Driver            :" "$LOG_FILE" | tail -n 1 | awk -F': ' '{print $2}')
latest_top_speed=$(grep "Top speed         :" "$LOG_FILE" | tail -n 1 | awk -F': ' '{print $2}')

echo "=== Kigali Transit Log Summary ($LOG_FILE) ==="
echo "Total sessions      : $sessions"
echo "Zebra stops         : $zebra_stops"
echo "Lane changes        : $lane_changes"
echo "Latest driver       : ${latest_driver:-N/A}"
echo "Latest top speed    : ${latest_top_speed:-N/A}"