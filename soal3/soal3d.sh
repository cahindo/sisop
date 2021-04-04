#!/bin/bash

pasword=$(date +%m%d%Y)

zip -r -P $pasword Koleksi.zip *

rm -r *-*
