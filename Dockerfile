FROM python:3.10.11

ENV PYTHONBUFFERED=1

WORKDIR /backend

COPY requirements.txt ./

RUN pip install --upgrade pip
RUN apt-get update && apt-get install -y git
RUN pip install -r requirements.txt
RUN pip install git+https://github.com/m-bain/whisperx.git
RUN apt-get -y update && apt-get -y upgrade && apt-get install -y --no-install-recommends ffmpeg
CMD python manage.py runserver

COPY . .

EXPOSE 8000