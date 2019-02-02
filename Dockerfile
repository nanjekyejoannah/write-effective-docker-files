FROM ubuntu
RUN apt-get update -y
RUN apt-get install -y python python-pip python-dev build-essential libpq-dev


# Create app directory
WORKDIR /app

# Install app dependencies
COPY src/requirements.txt ./

RUN pip install -r requirements.txt

# Bundle app source
COPY src /app

EXPOSE 8080
CMD [ "python", "app.py" ]