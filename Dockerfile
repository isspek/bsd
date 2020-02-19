FROM ubuntu:18.04

RUN apt-get update -y && \
    apt-get install -y python3-pip python-dev && apt-get install -y git

# We copy just the requirements.txt first to leverage Docker cache
COPY ./requirements.txt /app/requirements.txt

WORKDIR app

EXPOSE 8000

COPY bsdetector /app

RUN pip3 install -r requirements.txt

ENTRYPOINT [ "python3" ]

CMD [ "server.py" ]