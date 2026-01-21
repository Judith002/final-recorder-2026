FROM python:3.10-slim

# This line makes sure your logs aren't blank
ENV PYTHONUNBUFFERED=1

# Install the recorder tools
RUN apt-get update && apt-get install -y ffmpeg curl && rm -rf /var/lib/apt/lists/*
RUN curl -L https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp -o /usr/local/bin/yt-dlp && \
    chmod a+rx /usr/local/bin/yt-dlp

# Copy the instructions
COPY recorder.sh /recorder.sh
RUN chmod +x /recorder.sh

# Start the robot
CMD ["bash", "/recorder.sh"]
