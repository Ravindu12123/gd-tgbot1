FROM python:3.10.8
COPY requirements.txt .
RUN pip3 install --no-cache-dir -r requirements.txt
CMD gunicorn app:app & python3 bot.py
