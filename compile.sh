#!/bin/bash
webpack --progress --optimize-minimize
sass scss/main.scss:scss/main.min.css --style compressed --watch
