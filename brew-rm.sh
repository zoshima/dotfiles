#!/bin/bash
set -x
brew rm $1 -f 
brew deps $1 | xargs brew rm -f --ignore-dependencies
brew missing | cut -d: -f2 | sort | uniq | xargs brew install
