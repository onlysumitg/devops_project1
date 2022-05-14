# Base python image
FROM python:3.8

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

 
RUN apt-get update && apt-get install -y --no-install-recommends \
    unixodbc-dev \
    unixodbc \
    libpq-dev 
RUN apt-get update \
  # dependencies for building Python packages
  && apt-get install -y build-essential \
  # psycopg2 dependencies
  && apt-get install -y libpq-dev \
  # Translations dependencies
  && apt-get install -y gettext \
  # install nano
  && apt-get install -y nano \
  # cleaning up unused files
  && apt-get purge -y --auto-remove -o APT::AutoRemove::RecommendsImportant=false \
  && rm -rf /var/lib/apt/lists/*

 
# Make a direct to use as work dir. Application code will stay here
RUN mkdir /code
WORKDIR /code
COPY . /code/

 
# install the required packages
RUN pip install --upgrade pip \
    && pip install -r requirements.txt \
    && sed -i 's/\r$//g' start.sh \
    && chmod 777 start.sh
 
# application port
EXPOSE 8000
# Change this to UID that matches your username on the host
# Note: RUN commands before this line will execute as root in the container
# RUN commands after will execute under this non-privileged UID
USER 1000:1000
# start application
CMD ["./start.sh"]

 