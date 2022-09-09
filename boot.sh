#!/bin/bash

source venv/bin/activate
export export FLASK_APP=app/main.py
exec gunicorn --chdir app main:app -b 0.0.0.0:5000

source venv/bin/activate
flask db init
flask db migrate
flask db upgrade
deactivate

