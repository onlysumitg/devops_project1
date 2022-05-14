#!/bin/bash

# cd /home/sumit/ideaprojects/LineOfCredit
 
source LineOfCredit/.env
 
set -o errexit
set -o pipefail
set -o nounset

echo "Running migrations"
python manage.py makemigrations
python manage.py migrate
 
 

echo "Creating super user."
DJANGO_SUPERUSER_USERNAME=admin \
DJANGO_SUPERUSER_PASSWORD=adminpass \
DJANGO_SUPERUSER_EMAIL=onlysumitg@gmail.com \
python manage.py createsuperuser --noinput || true

 

python manage.py runserver 0.0.0.0:8000   --noreload 
