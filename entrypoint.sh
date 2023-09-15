#!/bin/bash

## 5. Migrate the Database

./manage.py migrate


## 6. Populate the Database

./manage.py updatecatalog


## 7. Collect Static Files

./manage.py collectstatic

## 8. Run the Server
## By default, the server runs on port 8000


./manage.py runserver 0.0.0.0:8000