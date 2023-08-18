# Use the official Python base image
FROM python:3.9

# Create and set the working directory inside the container
WORKDIR /app

# Copy all files from the local directory into the container
COPY . /app/

# Install ffmpeg
RUN apt-get update && \
    apt-get install -y ffmpeg

# Make shell scripts executable
RUN chmod +x alive.sh yt.sh run.sh

# Expose port 8080
EXPOSE 8080

# Run the Python script when the container starts
CMD ["python", "s.py"]
