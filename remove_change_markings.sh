#!/bin/sh

perl -0777 -pE 's/\\change(\{((?:[^}{]+|(?:(?1))*)*+)\})/$2/sg' -i "$1"
