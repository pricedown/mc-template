#!/usr/bin/env bash

git add . && git rm -r --cached . && git add . && git ls-files | less
