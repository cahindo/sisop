#!/bin/bash

PWD="/home/jogar/Documents/praktikum1"

pasword=$(date +%m%d%Y)

zip -r -P $pasword "$PWD/Koleksi.zip" *

rm -r "$PWD/*-*"
