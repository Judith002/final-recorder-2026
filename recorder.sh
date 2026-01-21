#!/bin/bash

# The target creator
URL="https://www.youtube.com/@CryptoWendyO/live"

echo "SYSTEM STARTING: The Robot is awake!"

while true; do
  echo "Checking if Wendy is live... $(date)"
  
  # This waits 30 seconds and records as soon as she is live
  yt-dlp -f "bestvideo[ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4]/best" \
         --live-from-start \
         --no-part \
         --wait-for-video 30 \
         --output "wendy_live_stream.mp4" \
         "$URL"
  
  echo "Stream ended. Searching again in 1 minute..."
  sleep 60
done
