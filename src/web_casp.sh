#!/bin/sh


php -S localhost:8000 &
open 'http://localhost:8000/server/index.html'
