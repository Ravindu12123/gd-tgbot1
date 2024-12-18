FROM python:3.9-slim

# Set the working directory
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . .

# Install ffmpeg
#RUN apt-get update && apt-get install -y ffmpeg && apt-get clean
#RUN apt -qq update && apt -qq install -y git python3 python3-pip ffmpeg

# Install Python dependencies
COPY requirements.txt .
RUN pip3 install --no-cache-dir -r requirements.txt

# Expose the port the app runs on (not strictly necessary for a Telegram bot)
#EXPOSE 8000
CMD gunicorn app:app & python3 -m bot
#CMD service chrony start && gunicorn app:app --bind 0.0.0.0:8000 & python3 -m bot
