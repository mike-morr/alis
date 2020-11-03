#!/usr/bin/env bash
git clone -b master git@github.com:mike-morr/alis.git
cd alis
git config --local user.email "pico.dev@gmail.com"
git config --local user.name "pico.dev"

git clone -b gh-pages git@github.com:mike-morr/alis.git deploy/
cd deploy
git config --local user.email "pico.dev@gmail.com"
git config --local user.name "pico.dev"

