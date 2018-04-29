#!/bin/bash
sass scss/main.scss:scss/main.min.css --style compressed
webpack --progress --watch --optimize-minimize
